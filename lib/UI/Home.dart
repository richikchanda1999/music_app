import 'package:flutter/material.dart';
import 'package:music_app/BLoC/Bookmarks.dart';
import 'package:music_app/BLoC/Home.dart';
import 'package:music_app/Models/Track.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Trending',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              Center(
                child: StreamBuilder<List<Track>>(
                  stream: HomeBLoC().getTracks,
                  builder: (_, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null)
                      return CircularProgressIndicator();
                    List<Track> tracks = snapshot.data;
                    return ListView.separated(
                      itemCount: tracks.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        thickness: 2.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Track track = tracks[index];
                        return ListTile(
                          onTap: () {
                            HomeBLoC().toTrackDetailPage(track);
                          },
                          title: Text(
                            track.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            track.albumName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: SizedBox(
                              width: 80,
                              height: 50,
                              child: Center(
                                  child: Text(
                                track.artistName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                          leading:
                              Icon(Icons.library_music, color: Colors.grey),
                        );
                      },
                    );
                  },
                ),
              ),
              Center(
                child: StreamBuilder<List<Track>>(
                  stream: BookmarkBLoC().getTracks,
                  builder: (_, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null)
                      return Container();
                    List<Track> tracks = snapshot.data;
                    if (tracks.length == 0)
                      return Center(
                        child: Text('No bookmarked tracks!'),
                      );
                    return ListView.separated(
                      itemCount: tracks.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        thickness: 2.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Track track = tracks[index];
                        return ListTile(
                          onTap: () {
                            HomeBLoC().toTrackDetailPage(track);
                          },
                          title: Text(
                            track.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            track.albumName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: SizedBox(
                              width: 80,
                              height: 50,
                              child: Center(
                                  child: Text(
                                track.artistName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ))),
                          leading:
                              Icon(Icons.library_music, color: Colors.grey),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: 50,
            child: TabBar(
              tabs: [
                Text('Tracks'),
                Text('Bookmarks'),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
            )),
      ),
    );
  }
}
