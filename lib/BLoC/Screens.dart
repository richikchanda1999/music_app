import 'package:music_app/BLoC/InternetConnectivity.dart';
import 'package:rxdart/rxdart.dart';

class ScreenBLoC {
  static final ScreenBLoC _bloc = ScreenBLoC._internal();
  factory ScreenBLoC() => _bloc;
  ScreenBLoC._internal();

  BehaviorSubject<Screens> _screenController;
  Function(Screens) get addScreen => _screenController.sink.add;
  Stream<Screens> get getScreen => Rx.combineLatest2(
        _screenController.stream,
        InternetConnectivity().getConnectivity,
        (a, b) {
          print('a: $a, b: $b');
          return b ? (a ?? Screens.HOME) : Screens.NO_INTERNET;
        },
      );

  void init() {
    _screenController = BehaviorSubject();
    addScreen(Screens.HOME);
  }

  Future<void> dispose() async {
    if (_screenController != null) {
      await _screenController.sink.close();
      await _screenController.close();
    }
  }
}

enum Screens { NO_INTERNET, HOME, TRACKS }
