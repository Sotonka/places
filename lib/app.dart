import 'package:flutter/material.dart';
import 'package:places/domain/settings.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Settings.themeIsLight,
      builder: (_, isLight, __) => MaterialApp(
        title: 'places',
        theme: isLight
            ? UIKit.themes.lightTheme.copyWith(
                extensions: [
                  ThemeColors.light,
                ],
              )
            : UIKit.themes.darkTheme.copyWith(
                extensions: [
                  ThemeColors.dark,
                ],
              ),
        debugShowCheckedModeBanner: false,
        home: const SightListScreen(),
      ),
    );
  }
}
