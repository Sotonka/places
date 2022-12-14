import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/settings.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/providers/app_providers.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final filter = Filter();
  final placesList = mocks;
  final List<String> searchHistory = [];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: ValueListenableBuilder(
        valueListenable: Settings.themeIsLight,
        builder: (_, isLight, __) => MaterialApp(
          initialRoute: AppRouter.root,
          onGenerateRoute: AppRouter.generateRoute,
          title: 'places',
          theme: isLight
              ? AppTheme.lightTheme.copyWith(
                  extensions: [
                    AppThemeColors.light,
                  ],
                )
              : AppTheme.darkTheme.copyWith(
                  extensions: [
                    AppThemeColors.dark,
                  ],
                ),
          debugShowCheckedModeBanner: false,
          home: const SightListScreen(),
        ),
      ),
    );
  }
}
