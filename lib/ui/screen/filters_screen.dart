import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/utils/utils.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/filter_tile.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilterProvider(),
      child: const _FiltersScreen(),
    );
  }
}

class _FiltersScreen extends StatelessWidget {
  const _FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<FilterProvider>().filter;

    var filteredPlaces = <Sight>[];

    for (final sight in mocks) {
      if (filter.categories.contains(sight.type) &&
          Utils().arePointsNear(
            checkPoint: sight.coord,
            centerPoint: Coord(lat: 48.483385, lon: 135.07593),
            kmEnd: filter.distance.end / 1000,
            kmStart: filter.distance.start / 1000,
          )) {
        filteredPlaces.add(sight);
      }
    }

    return Scaffold(
      appBar: const _BuildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              _BuildCategories(),
              _BuildSlider(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 16,
              right: 16,
            ),
            child: ColoredButton(
              text:
                  '${AppStrings.filtersScreenShow} (${filteredPlaces.length})',
              onPressed: () {
                Navigator.pop(context, filteredPlaces);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(400);

  const _BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;
    final filter = context.watch<FilterProvider>().filter;

    return SmallAppBar(
      titleWidget: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.sights,
                );
              },
              child: Container(
                height: 32,
                width: 32,
                color: Colors.transparent,
                child: AppIcons.back(
                  color: AppColors.primaryBlueE5B,
                ),
              ),
            ),
            InkWell(
              onTap: () => context.read<FilterProvider>().update(
                    filter.clear(),
                  ),
              child: Text(
                AppStrings.filtersScreenClear,
                style: theme.primaryTextTheme.headline6!.copyWith(
                  color: themeColors.greenAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildCategories extends StatelessWidget {
  const _BuildCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;
    final filter = context.watch<FilterProvider>().filter;
    final categoryRow1 = <_Category>[
      _Category(
        type: SightType.hotel,
        name: 'Отель',
        icon: AppIcons.hotel(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.restaurant,
        name: 'Ресторан',
        icon: AppIcons.restaurant(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.particular,
        name: 'Особое место',
        icon: AppIcons.particular(
          color: themeColors.greenAccent,
        ),
      ),
    ];
    final categoryRow2 = <_Category>[
      _Category(
        type: SightType.park,
        name: 'Парк',
        icon: AppIcons.park(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.museum,
        name: 'Музей',
        icon: AppIcons.museum(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.cafe,
        name: 'Кафе',
        icon: AppIcons.cafe(
          color: themeColors.greenAccent,
        ),
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.filtersScreenCategories,
              style: theme.primaryTextTheme.bodyText2,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var element in categoryRow1)
              FilterTile(
                placeType: element.name,
                icon: element.icon,
                isActive: filter.categories.contains(element.type),
                onPressed: () => context.read<FilterProvider>().update(
                      filter.toggleCategory(element.type),
                    ),
              ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var element in categoryRow2)
              FilterTile(
                placeType: element.name,
                icon: element.icon,
                isActive: filter.categories.contains(element.type),
                onPressed: () => context.read<FilterProvider>().update(
                      filter.toggleCategory(element.type),
                    ),
              ),
          ],
        ),
      ],
    );
  }
}

class _BuildSlider extends StatelessWidget {
  const _BuildSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;
    final filter = context.watch<FilterProvider>().filter;

    return Column(
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.filtersScreenDistance,
                style: theme.primaryTextTheme.headline6,
              ),
              Text(
                'от ${(filter.distance.start / 1000).round()} до ${(filter.distance.end / 1000).round()} км',
                style: theme.primaryTextTheme.headline6!.copyWith(
                  color: AppColors.primaryLightInactive,
                ),
              ),
            ],
          ),
        ),
        SliderTheme(
          data: AppTheme.sliderTheme.copyWith(
            activeTrackColor: themeColors.greenAccent,
          ),
          child: RangeSlider(
            values: RangeValues(
              filter.distance.start,
              filter.distance.end,
            ),
            max: 30000,
            divisions: 30,
            onChanged: (values) {
              if (values.start.round() >= values.end.round()) return;
              context.read<FilterProvider>().update(
                    filter.copyWith(
                      distance: Range(values.start, values.end),
                    ),
                  );
            },
          ),
        ),
      ],
    );
  }
}

class FilterProvider with ChangeNotifier {
  Filter get filter => _filter;

  Filter _filter = Filter();

  void update(Filter newFilter) {
    _filter = newFilter;
    notifyListeners();
  }
}

class _Category {
  SightType type;
  String name;
  Widget icon;

  _Category({
    required this.type,
    required this.name,
    required this.icon,
  });
}
