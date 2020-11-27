import 'dart:convert';

import 'package:http/http.dart';
import 'package:music_app/Models/Lyrics.dart';
import 'package:music_app/Models/Track.dart';
import 'package:rxdart/rxdart.dart';

import 'Screens.dart';

class TracksBLoC {
  static final TracksBLoC _bloc = TracksBLoC._internal();
  factory TracksBLoC() => _bloc;
  TracksBLoC._internal();

  BehaviorSubject<Track> _trackController;
  Function(Track) get addTrack => _trackController.sink.add;
  Stream<Track> get getTrack => _trackController.stream;

  BehaviorSubject<Lyrics> _lyricsController;
  Function(Lyrics) get addLyrics => _lyricsController.sink.add;
  Stream<Lyrics> get getLyrics => _lyricsController.stream;

  void init(int trackID) {
    _trackController = BehaviorSubject();
    _lyricsController = BehaviorSubject();
    fetchTrack(trackID);
  }

  Future<void> fetchTrack(int trackID) async {
    print(trackID);
    String trackURL =
        'https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackID&apikey=4064db6ee21a0b1db5e09bb2d2627a4e';
    Response res = await get(trackURL);
    print(res.statusCode);
    Map<String, dynamic> dec = json.decode(res.body);
    print(dec);
    if (res.statusCode == 200 &&
        dec['message']['header']['status_code'] == 200) {
      Track track = Track.fromMap(
          Map<String, dynamic>.from(dec['message']['body']['track']));
      addTrack(track);
    } else {
      print(dec);
      addTrack(null);
    }
    fetchLyrics(trackID);
  }

  Future<void> fetchLyrics(int trackID) async {
    String lyricsURL =
        'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackID&apikey=4064db6ee21a0b1db5e09bb2d2627a4e';
    Response res = await get(lyricsURL);
    Map<String, dynamic> dec = json.decode(res.body);
    if (res.statusCode == 200 &&
        dec['message']['header']['status_code'] == 200) {
      Lyrics lyrics = Lyrics.fromMap(
          Map<String, dynamic>.from(dec['message']['body']['lyrics']));
      addLyrics(lyrics);
    } else {
      print(dec);
      addLyrics(null);
    }
  }

  Future<void> back() async {
    await dispose();
    ScreenBLoC().addScreen(Screens.HOME);
  }

  Future<void> dispose() async {
    if (_trackController != null) {
      await _trackController.sink.close();
      await _trackController.close();
    }
    if (_lyricsController != null) {
      await _lyricsController.sink.close();
      await _lyricsController.close();
    }
  }
}
