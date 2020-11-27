
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music_app/BLoC/Bookmarks.dart';
import 'package:music_app/BLoC/Home.dart';
import 'package:path_provider/path_provider.dart';
import 'BLoC/Screens.dart';
import 'UI/Home.dart';
import 'UI/NoInternet.dart';
import 'UI/Tracks.dart';
import 'BLoC/InternetConnectivity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationSupportDirectory()).path);
  InternetConnectivity().init();
  ScreenBLoC().init();

  await BookmarkBLoC().init();

  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigator(),
    );
  }
}

class MyNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Screens>(
      stream: ScreenBLoC().getScreen,
      builder: (_, __) {
        Screens screen = __.data;
        print('Screen: $screen');
        switch(screen) {
          case Screens.NO_INTERNET:
            return NoInternetScreen();
            break;
          case Screens.HOME:
            HomeBLoC().init();
            return HomeScreen();
            break;
          case Screens.TRACKS:
            return TracksScreen();
            break;
          default:
            return Scaffold();
        }
      },
    );
  }
}

