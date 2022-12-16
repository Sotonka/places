import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/settings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

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
    return ValueListenableBuilder(
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
        home: DataInheritedWidget(
          filter: Filter(),
          placesList: mocks,
          searchHistory: searchHistory,
          child: const SightListScreen(),
        ),
      ),
    );
  }
}

class DataInheritedWidget extends InheritedWidget {
  final Filter filter;
  final List<Sight> placesList;
  final List<String> searchHistory;

  const DataInheritedWidget({
    super.key,
    required this.filter,
    required this.placesList,
    required this.searchHistory,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(DataInheritedWidget oldWidget) => false;

  static DataInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DataInheritedWidget>()
          as DataInheritedWidget;
}
