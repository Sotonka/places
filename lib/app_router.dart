import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/screen/test_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

abstract class AppRouter {
  static const String root = '/';
  static const String sights = '/sights';
  static const String sightDetails = '/sightDetails';
  static const String visitingScreen = '/visitingScreen';
  static const String settings = '/settings';
  static const String filterScreen = '/filterScreen';
  static const String addSightScreen = '/addSightScreen';
  static const String test = '/test';
  static const String search = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.sights:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SightListScreen(),
        );
      case AppRouter.sightDetails:
        final arguments = settings.arguments as Map<String, dynamic>;
        final sight = arguments['sight'] as Sight;

        return MaterialPageRoute<Object?>(
          builder: (_) => SightDetails(sight: sight),
        );
      case AppRouter.settings:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SettingsScreen(),
        );
      case AppRouter.filterScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const FiltersScreen(),
        );
      case AppRouter.search:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SightSearchScreen(),
        );
      case AppRouter.visitingScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const VisitingScreen(),
        );
      case AppRouter.addSightScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const AddSightScreen(),
        );
      case AppRouter.test:
        return MaterialPageRoute<Object?>(
          builder: (_) => const TestScreen(),
        );
      case AppRouter.root:
      default:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SightListScreen(),
        );
    }
  }
}
