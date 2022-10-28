import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'places',
      theme: UIKit.themes.lightTheme.copyWith(
        extensions: [
          ThemeColors.light,
        ],
      ),
      /* theme: UIKit.themes.darkTheme.copyWith(
        extensions: [
          ThemeColors.dark,
        ],
      ), */
      debugShowCheckedModeBanner: false,
      home: const SightListScreen(),
    );
  }
}
