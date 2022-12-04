import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/gradient_button.dart';
import 'package:places/ui/widget/nothing_found.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/sight_list_screen_app_bar.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class SightListScreen extends StatelessWidget {
  const SightListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SightListProvider(),
        ),
      ],
      child: const _SighListScreen(),
    );
  }
}

class _SighListScreen extends StatelessWidget {
  const _SighListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.sightListScreenTitle),
      body: Stack(
        children: [
          Consumer<SightListProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: SearchBar(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRouter.search,
                        );
                      },
                      filters: provider.filterIsActive,
                      onSuffixPressed: () async {
                        provider
                          ..filter = await Navigator.push<Filter?>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FiltersScreen(),
                            ),
                          )
                          ..filterIsActive = true;
                      },
                    ),
                  ),
                  const SizedBox(height: 38),
                  Expanded(
                    child: provider.sightList.isEmpty
                        ? const NotFound()
                        : CardList(
                            iterable: provider.sightList,
                            type: CardType.list,
                          ),
                  ),
                ],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientButton(
                    text: 'НОВОЕ МЕСТО',
                    onPressed: () async {
                      context
                          .read<SightListProvider>()
                          .appendSigtList(await Navigator.push<Sight>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddSightScreen(),
                            ),
                          ));
                    },
                    icon: AppIcons.add(
                      height: 18,
                      width: 18,
                      color: AppColors.primaryLightFFF,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}

class SightListProvider with ChangeNotifier {
  final List<Sight> _sightList = mocks;

  Filter? get filter => _filter;

  List<Sight> get sightList {
    if (filteredPlaces != null) {
      return filteredPlaces!;
    }

    return _sightList;
  }

  bool get filterIsActive => _filterIsActive;

  List<Sight>? get filteredPlaces {
    if (_filter == null) return null;
    _filteredPlaces = [];
    for (final sight in mocks) {
      if (_filter!.categories.contains(sight.type) &&
          Utils().arePointsNear(
            checkPoint: sight.coord,
            centerPoint: Coord(lat: 48.483385, lon: 135.07593),
            kmEnd: _filter!.distance.end / 1000,
            kmStart: _filter!.distance.start / 1000,
          )) {
        _filteredPlaces!.add(sight);
      }
    }

    return _filteredPlaces;
  }

  set filter(Filter? value) {
    _filter = value;
    notifyListeners();
  }

  set filteredPlaces(List<Sight>? value) {
    _filteredPlaces = value;
    notifyListeners();
  }

  set filterIsActive(bool value) {
    _filterIsActive = value;
    notifyListeners();
  }

  List<Sight>? _filteredPlaces;
  bool _filterIsActive = false;
  Filter? _filter;

  void appendSigtList(Sight? newSight) {
    if (newSight != null) {
      notifyListeners();
    }
  }
}
