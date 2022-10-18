import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'places',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: const SightListScreen(),
      // home: const MySecondWidget(),
    );
  }
}
