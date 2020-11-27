import 'dart:convert';

import 'package:http/http.dart';
import 'package:music_app/BLoC/Screens.dart';
import 'package:music_app/BLoC/Tracks.dart';
import 'package:music_app/Models/Track.dart';
import 'package:rxdart/rxdart.dart';

class HomeBLoC {
  static final HomeBLoC _bloc = HomeBLoC._internal();
  factory HomeBLoC() => _bloc;
  HomeBLoC._internal();
  String allTracksURL;

  BehaviorSubject<List<Track>> _trackController;
  Function(List<Track>) get addTracks => _trackController.sink.add;
  Stream<List<Track>> get getTracks => _trackController.stream;

  Track selectedTrack;

  void init() {
    allTracksURL =
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=4064db6ee21a0b1db5e09bb2d2627a4e';
    _trackController = BehaviorSubject();
    addTracks(null);
    fetch();
  }

  void toTrackDetailPage(Track track) {
    selectedTrack = track;
    TracksBLoC().init();
    ScreenBLoC().addScreen(Screens.TRACKS);
  }

  Future<void> fetch() async {
    List<Track> tracks = List();
    Response res = await get(allTracksURL);
    Map<String, dynamic> dec = json.decode(res.body);
    if (res.statusCode == 200 && dec['message']['header']['status_code'] == 200) {
      for (dynamic _ in dec['message']['body']['track_list'])
        tracks.add(Track.fromMap(Map<String, dynamic>.from(_)['track']));
    } else print(dec);
    addTracks(tracks);
  }

  Future<void> dispose() async {
    if (_trackController != null) {
      await _trackController.sink.close();
      await _trackController.close();
    }
  }
}
