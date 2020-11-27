import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:music_app/Models/Track.dart';

class BookmarkDB {
  static final BookmarkDB _db = BookmarkDB._internal();
  factory BookmarkDB() => _db;
  BookmarkDB._internal();

  Box _box;
  String boxName = 'bookmarks';

  Future<void> init() async {
    _box = await Hive.openBox(boxName);
  }

  List<Track> getTracks() {
    List<Track> tracks = List();
    for(int key in _box.keys)
      tracks.add(Track.fromMap(Map<String,dynamic>.from(json.decode(_box.get(key)))));
    return tracks;
  }

  Future<void> addTrack(Track track) async {
    await _box.put(track.trackID, json.encode(track.toMap()));
  }

  Future<void> removeTrack(Track track) async {
    if (_box.containsKey(track.trackID)) await _box.delete(track.trackID);
  }

  Future<void> dispose() async {
    await _box.close();
  }
}