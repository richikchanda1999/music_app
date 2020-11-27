import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:connectivity/connectivity.dart';

class InternetConnectivity {
  static final InternetConnectivity _instance = InternetConnectivity._internal();
  factory InternetConnectivity() => _instance;
  InternetConnectivity._internal();

  Connectivity _connectivity = Connectivity();

  BehaviorSubject<bool> _connectivityController;
  Function(bool) get addConnectivity => _connectivityController.sink.add;
  Stream<bool> get getConnectivity => _connectivityController.stream;

  void init() async {
    _connectivityController = BehaviorSubject();
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      print('1: ${ConnectivityResult.values[result.index]}');
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final resultWifi = await InternetAddress.lookup('google.com');
      print(resultWifi.length);
      print(resultWifi[0].rawAddress);
      isOnline = resultWifi.isNotEmpty && resultWifi[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      print('Lookup Exception: $_');
      isOnline = false;
    }
    isOnline = isOnline && result != ConnectivityResult.none;
    addConnectivity(isOnline);
  }

  Future<void> dispose() async {
    if (_connectivityController != null) {
      await _connectivityController.sink.close();
      await _connectivityController.close();
    }
  }
}