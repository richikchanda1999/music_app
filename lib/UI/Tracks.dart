import 'package:flutter/material.dart';
import 'package:music_app/BLoC/Tracks.dart';
import 'package:music_app/Models/Lyrics.dart';
import 'package:music_app/Models/Track.dart';

class TracksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: TracksBLoC().back,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: StreamBuilder<Track>(
            stream: TracksBLoC().getTrack,
            builder: (_, snapshot) {
              if (!snapshot.hasData || snapshot.data == null)
                return Container();
              Track track = snapshot.data;
              return ListView(
                children: [
                  ListTile(
                    title: Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      track.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Artist',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      track.artistName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Album',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      track.albumName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Explicit',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      track.isExplicit.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                  StreamBuilder<Lyrics>(
                      stream: TracksBLoC().getLyrics,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.data == null)
                          return Container();
                        Lyrics lyrics = snapshot.data;
                        return ListTile(
                          title: Text(
                            'Lyrics',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            lyrics.body,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        );
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
