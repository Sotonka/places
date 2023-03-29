import 'package:places/ui/providers/add_photo_provider.dart';
import 'package:places/ui/providers/add_sight_provider.dart';
import 'package:places/ui/providers/filter_provider.dart';
import 'package:places/ui/providers/onboarding_provider.dart';
import 'package:places/ui/providers/search_provider.dart';
import 'package:places/ui/providers/sight_details_provider.dart';
import 'package:places/ui/providers/sight_list_provider.dart';
import 'package:places/ui/providers/theme_provider.dart';
import 'package:places/ui/providers/visiting_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<AddSightProvider>(
    create: (_) => AddSightProvider(),
  ),
  ChangeNotifierProvider<AddPhotoProvider>(
    create: (_) => AddPhotoProvider(),
  ),
  ChangeNotifierProvider<FilterProvider>(
    create: (_) => FilterProvider(),
  ),
  ChangeNotifierProvider<OnboardingProvider>(
    create: (_) => OnboardingProvider(),
  ),
  ChangeNotifierProvider<SearchProvider>(
    create: (_) => SearchProvider(),
  ),
  ChangeNotifierProvider<SightDetailsProvider>(
    create: (_) => SightDetailsProvider(),
  ),
  ChangeNotifierProvider<SightListProvider>(
    create: (_) => SightListProvider(),
  ),
  ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
  ),
  ChangeNotifierProvider<VisitingProvider>(
    create: (_) => VisitingProvider(),
  ),
];
