import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:places/app_router.dart';
import 'package:places/bloc/favourites/favourites_bloc.dart';
import 'package:places/bloc/visited/visited_bloc.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/ui/providers/app_providers.dart';
import 'package:places/ui/providers/theme_provider.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<FavouritesBloc>(
                create: (context) =>
                    // TODO add DI later
                    FavouritesBloc(placeInteractor: PlaceInteractor()),
              ),
              BlocProvider<VisitedBloc>(
                create: (context) =>
                    // TODO add DI later
                    VisitedBloc(placeInteractor: PlaceInteractor()),
              ),
            ],
            child: MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en'),
                Locale('ru'),
              ],
              initialRoute: AppRouter.root,
              onGenerateRoute: AppRouter.generateRoute,
              title: 'places',
              theme: provider.themeIsLight
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
          );
        },
      ),
    );
  }
}
