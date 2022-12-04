// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:places/ui/widget/sight_card_tab.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class SightSearchScreen extends StatelessWidget {
  const SightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
      ],
      child: const _SightSearchScreen(),
    );
  }
}

class _SightSearchScreen extends StatelessWidget {
  const _SightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      appBar: const SmallAppBar(
        title: 'Список интересных мест',
      ),
      body: Consumer<SearchProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 6,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                SearchBar(
                  onChange: (value) {
                    provider.findSights(value);
                  },
                  onComplete: () {
                    //provider.clearSearch();
                    // диссмисить клавиатуру по нажатию
                    provider.searchFocus.unfocus();
                  },
                  controller: provider.searchController,
                  readOnly: false,
                  filters: provider.filterIsActive,
                  focus: provider.searchFocus,
                  suffixClose: provider.searching,
                  onPressed: () {
                    provider.searching = true;
                  },
                  onSuffixPressed: provider.searching
                      ? () {
                          provider.clearSearch();
                        }
                      : () async {
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
                Expanded(
                  child: provider.searching
                      ? const _BuildSightList()
                      : Column(
                          children: [
                            const SizedBox(height: 38),
                            Expanded(
                              child: provider.history.isEmpty
                                  ? const SizedBox()
                                  : const _BuildSearchHistory(),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}

class _BuildSightList extends StatelessWidget {
  const _BuildSightList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return provider.searchResult == null
          // ЗАМЕНИТЬ НА ЭКРАН НИЧЕГО НЕ НАЙДЕНО
          ? const SizedBox()
          : ListView.builder(
              itemCount: provider.searchResult!.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  provider.addHistory(provider.searchResult![index].name);
                  Navigator.of(context).pushNamed(
                    AppRouter.sightDetails,
                    arguments: {
                      'sight': provider.searchResult![index],
                    },
                  );
                },
                child: SightCardTab(
                  sight: provider.searchResult![index],
                  search: provider.searchController.text,
                ),
              ),
            );
    });
  }
}

class _BuildSearchHistory extends StatelessWidget {
  const _BuildSearchHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'НАЗВАНИЕ',
                style: theme.primaryTextTheme.bodyText2,
              ),
            ),
            const SizedBox(height: 19),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.history.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 13,
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            provider
                                .setSearchController(provider.history[index]);
                          },
                          child: Text(
                            provider.history[index],
                            style: AppTextStyle.middle16.copyWith(
                              color: AppColors.primaryLightE92,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            provider.removeAtHistory(index);
                          },
                          child: AppIcons.close(
                            color: AppColors.primaryLightE92,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: provider.clearHistory,
                child: Text(
                  'Очистить историю',
                  style: theme.primaryTextTheme.headline6!.copyWith(
                    color: themeColors.greenAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class SearchProvider with ChangeNotifier {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  List<String> get history => _history;
  FocusNode get searchFocus => _searchFocus;
  TextEditingController get searchController => _searchController;
  bool get searching => _searching && _searchController.text != '';
  Filter? get filter => _filter;
  List<Sight>? get searchResult => _searchResult;

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

  set searching(bool value) {
    _searching = value;
    notifyListeners();
  }

  bool _searching = false;
  bool _filterIsActive = false;
  Filter? _filter;
  List<Sight>? _filteredPlaces;
  List<Sight>? _searchResult;
  List<Sight> _sightList = mocks;
  List<String> _history = [];

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void addHistory(String element) {
    if (_history.contains(element)) {
    } else {
      _history.add(element);
      notifyListeners();
    }
  }

  void removeAtHistory(int index) {
    _history.removeAt(index);
    notifyListeners();
  }

  void clearHistory() {
    _history = [];
    notifyListeners();
  }

  void clearSearch() {
    searchController.text = '';
    notifyListeners();
  }

  void setSearchController(String value) {
    _searchController
      ..text = value
      ..selection =
          TextSelection.collapsed(offset: _searchController.text.length);
    notifyListeners();
  }

  void findSights(String value) {
    _searchResult = [];

    _sightList = mocks;

    for (final element in sightList) {
      if (value.length > element.name.length) {
      } else if (element.name.substring(0, value.length).toLowerCase() ==
          searchController.text.toLowerCase()) {
        if (_searchResult!.contains(element)) {
        } else {
          _searchResult!.add(element);
        }
      } else {
        // ДЕЛАТЬ ЕГО NULL И ПРОВЕРЯТЬ ЕСЛИ NULL ТО ЭКРАН ОШИБКИ
        //_searchResult = [];
      }
    }

    notifyListeners();
  }
}
