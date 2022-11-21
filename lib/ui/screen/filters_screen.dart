import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/utils/utils.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/filter_tile.dart';
import 'package:places/ui/widget/small_app_bar.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Filter filter = Filter();

  @override
  void initState() {
    super.initState();
    filter = Filter();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<ThemeColors>()!;

    final categoryRow1 = <_Category>[
      _Category(
        type: SightType.hotel,
        name: 'Отель',
        icon: UIKit.svg.hotel(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.restaurant,
        name: 'Ресторан',
        icon: UIKit.svg.restaurant(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.particular,
        name: 'Особое место',
        icon: UIKit.svg.particular(
          color: themeColors.greenAccent,
        ),
      ),
    ];
    final categoryRow2 = <_Category>[
      _Category(
        type: SightType.park,
        name: 'Парк',
        icon: UIKit.svg.park(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.museum,
        name: 'Музей',
        icon: UIKit.svg.museum(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: SightType.cafe,
        name: 'Кафе',
        icon: UIKit.svg.cafe(
          color: themeColors.greenAccent,
        ),
      ),
    ];
    final filteredPlaces = <Sight>[];

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
      appBar: SmallAppBar(
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
                  child:
                      // UIKit.appIcons.appIcon(path: 'back', color: UIKit.colors.primaryBlueE5B,),

                      UIKit.svg.back(
                    color: UIKit.colors.primaryBlueE5B,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    filter = filter.clear();
                  });
                },
                child: Text(
                  UIKit.strings.filtersScreenClear,
                  style: theme.primaryTextTheme.headline6!.copyWith(
                    color: themeColors.greenAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        UIKit.strings.filtersScreenCategories,
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
                          onPressed: () {
                            setState(() {
                              filter = filter.toggleCategory(element.type);
                            });
                          },
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
                          onPressed: () {
                            setState(() {
                              filter = filter.toggleCategory(element.type);
                            });
                          },
                        ),
                    ],
                  ),
                ],
              ),
              Column(
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
                          UIKit.strings.filtersScreenDistance,
                          style: theme.primaryTextTheme.headline6,
                        ),
                        Text(
                          'от ${(filter.distance.start / 1000).round()} до ${(filter.distance.end / 1000).round()} км',
                          style: theme.primaryTextTheme.headline6!.copyWith(
                            color: UIKit.colors.primaryLightInactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: UIKit.themes.sliderTheme.copyWith(
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
                        setState(() {
                          filter = filter.copyWith(
                            distance: Range(values.start, values.end),
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
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
                  '${UIKit.strings.filtersScreenShow} (${filteredPlaces.length})',
              onPressed: () {
                // ignore: avoid_print
                print(filter.categories);
                // ignore: avoid_print
                print((filter.distance.start / 1000).round());
                // ignore: avoid_print
                print((filter.distance.end / 1000).round());

                for (final element in filteredPlaces) {
                  // ignore: avoid_print
                  print(element.name);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Category {
  SightType type;
  String name;
  SvgPicture icon;

  _Category({
    required this.type,
    required this.name,
    required this.icon,
  });
}
