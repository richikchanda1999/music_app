/*
* 'album_id': 39576526,
 'album_name': 'WAP (feat. Megan Thee Stallion)',
 'artist_id': 46196205,
 'artist_name': 'Cardi B feat. Megan Thee Stallion',
 'commontrack_id': 114611205,
 'explicit': 1,
 'has_lyrics': 1,
 'has_richsync': 1,
 'has_subtitles': 1,
 'instrumental': 0,
 'num_favourite': 985,
 'primary_genres': {'music_genre_list': [{'music_genre': {'music_genre_id': 34,
                                                          'music_genre_name': 'Music',
                                                          'music_genre_name_extended': 'Music',
                                                          'music_genre_parent_id': 0,
                                                          'music_genre_vanity': 'Music'}}]},
 'restricted': 0,
 'track_edit_url': 'https://www.musixmatch.com/lyrics/Cardi-B-Megan-Thee-Stallion/WAP-Megan-Thee-Stallion/edit?utm_source=application&utm_campaign=api&utm_medium=n%2Fa%3A1409620463618',
 'track_id': 201234497,
 'track_name': 'WAP (feat. Megan Thee Stallion)',
 'track_name_translation_list': [],
 'track_rating': 99,
 'track_share_url': 'https://www.musixmatch.com/lyrics/Cardi-B-Megan-Thee-Stallion/WAP-Megan-Thee-Stallion?utm_source=application&utm_campaign=api&utm_medium=n%2Fa%3A1409620463618',
 'updated_time': '2020-10-10T10:41:53Z'
*/

import 'MusicGenre.dart';

class Track {
  String albumName, artistName, editURL, shareURL, name, updatedTime;
  int albumID, artistID, commonTrackID, numFavourite, trackID, trackRating;
  bool isExplicit,
      hasLyrics,
      hasRichSync,
      hasSubtitles,
      isInstrumental,
      isRestricted;
  List<MusicGenre> musicGenreList;

  Track.fromMap(Map<String, dynamic> map) {
    albumID = map['album_id'];
    albumName = map['album_name'];
    artistID = map['artist_id'];
    artistName = map['artist_name'];
    commonTrackID = map['commontrack_id'];
    isExplicit = map['explicit'] == 1;
    hasLyrics = map['has_lyrics'] == 1;
    hasRichSync = map['has_richsync'] == 1;
    hasSubtitles = map['has_subtitles'] == 1;
    isInstrumental = map['instrumental'] == 1;
    numFavourite = map['num_favourite'];
    musicGenreList = List();
    for (dynamic _ in map['primary_genres']['music_genre_list'])
      musicGenreList
          .add(MusicGenre.fromMap(Map<String, dynamic>.from(_['music_genre'])));
    isRestricted = map['restricted'] == 1;
    editURL = map['track_edit_url'];
    trackID = map['track_id'];
    name = map['track_name'];
    trackRating = map['track_rating'];
    shareURL = map['track_share_url'];
    updatedTime = map['updated_time'];
  }

  Map<String, dynamic> toMap() => {
        'album_id': albumID,
        'album_name': albumName,
        'artist_id': artistID,
        'artist_name': artistName,
        'commontrack_id': commonTrackID,
        'explicit': isExplicit ? 1 : 0,
        'has_lyrics': hasLyrics ? 1 : 0,
        'has_richsync': hasRichSync ? 1 : 0,
        'has_subtitles': hasSubtitles ? 1 : 0,
        'instrumental': isInstrumental ? 1 : 0,
        'num_favourite': numFavourite,
        'primary_genres': {
          'music_genre_list': musicGenreList.map((e) => e.toMap()).toList()
        },
        'restricted': isRestricted,
        'track_edit_url': editURL,
        'track_id': trackID,
        'track_name': name,
        'track_rating': trackRating,
        'track_share_url': shareURL,
        'updated_time': updatedTime,
      };
}
