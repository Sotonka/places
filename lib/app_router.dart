import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';
import 'package:places/ui/screen/test_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

abstract class AppRouter {
  static const String root = '/';
  static const String addSightScreen = '/addSightScreen';
  static const String filterScreen = '/filterScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String searchScreen = '/searchScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String sightDetailsScreen = '/sightDetailsScreen';
  static const String sightListScreen = '/sightListScreen';
  static const String splashScreen = '/splashScreen';
  static const String testScreen = '/testScreen';
  static const String visitingScreen = '/visitingScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.addSightScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const AddSightScreen(),
        );

      case AppRouter.filterScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const FiltersScreen(),
        );

      case AppRouter.onboardingScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const OnboardingScreen(),
        );

      case AppRouter.searchScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SightSearchScreen(),
        );

      case AppRouter.settingsScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SettingsScreen(),
        );

      case AppRouter.sightDetailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        final id = arguments['id'] as int;

        return MaterialPageRoute<Object?>(
          builder: (_) => SightDetails(id: id),
        );

      case AppRouter.sightListScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SightListScreen(),
        );

      case AppRouter.splashScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SplashScreen(),
        );

      case AppRouter.testScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const TestScreen(),
        );

      case AppRouter.visitingScreen:
        return MaterialPageRoute<Object?>(
          builder: (_) => const VisitingScreen(),
        );

      case AppRouter.root:

      default:
        return MaterialPageRoute<Object?>(
          builder: (_) => const SightListScreen(),
        );
    }
  }
}
