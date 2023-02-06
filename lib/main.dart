import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //DeviceOrientation.landscapeLeft,
    //DeviceOrientation.landscapeRight
  ]);
  runApp(const App());
}
