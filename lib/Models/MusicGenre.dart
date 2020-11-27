/*
*{'music_genre_id': 34,
* 'music_genre_parent_id': 0,
* 'music_genre_name': 'Music',
* 'music_genre_name_extended': 'Music',
* 'music_genre_vanity': 'Music'}
*/

class MusicGenre {
  int id, parentID;
  String name, nameExtended, vanity;

  MusicGenre.fromMap(Map<String, dynamic> map) {
    id = map['music_genre_id'];
    parentID = map['music_genre_parent_id'];
    name = map['music_genre_name'];
    nameExtended = map['music_genre_name_extended'];
    vanity = map['music_genre_vanity'];
  }
}