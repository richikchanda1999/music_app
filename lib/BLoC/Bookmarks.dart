import 'package:music_app/DB/BookmarkDB.dart';
import 'package:music_app/Models/Track.dart';
import 'package:rxdart/rxdart.dart';

class BookmarkBLoC {
  static final BookmarkBLoC _bloc = BookmarkBLoC._internal();
  factory BookmarkBLoC() => _bloc;
  BookmarkBLoC._internal();

  BehaviorSubject<List<Track>> _trackController;
  Function(List<Track>) get addTracks => _trackController.sink.add;
  Stream<List<Track>> get getTracks => _trackController.stream;

  List<Track> bookmarked;

  Future<void> init() async {
    _trackController = BehaviorSubject();
    bookmarked = List();

    await BookmarkDB().init();
    populate();
  }

  void populate() {
    bookmarked = BookmarkDB().getTracks();
    addTracks(bookmarked);
  }

  bool isBookmarked(Track track) {
    return bookmarked.map((b) => b.trackID).contains(track.trackID);
  }

  Future<void> addBookmark(Track track) async {
    await BookmarkDB().addTrack(track);
    populate();
  }

  Future<void> removeBookmark(Track track) async {
    await BookmarkDB().removeTrack(track);
    populate();
  }

  Future<void> dispose() async {
    if (_trackController != null) {
      await _trackController.sink.close();
      await _trackController.close();
    }
  }
}