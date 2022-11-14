import 'package:flutter/material.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/ui_kit/utils.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/filter_tile.dart';
import 'package:places/ui/widget/small_app_bar.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late Filter filter;

  @override
  void initState() {
    super.initState();
    filter = Filter();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: SmallAppBar(
        titleWidget: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SightListScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.transparent,
                  child: UIKit.assets.svg.back(
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
                  'Очистить',
                  style: theme.primaryTextTheme.headline6!.copyWith(
                    color: UIKit.colors.greenF50,
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'КАТЕГОРИИ',
                    style: theme.primaryTextTheme.bodyText2,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterTile(
                    placeType: 'Отель',
                    icon: UIKit.assets.svg.hotel(
                      color: UIKit.colors.greenF50,
                    ),
                    isActive: filter.categories.contains(SightType.hotel),
                    onPressed: () {
                      setState(() {
                        filter = filter.toggleCategory(SightType.hotel);
                      });
                      // ignore: avoid_print
                      print(filter.categories);
                    },
                  ),
                  FilterTile(
                    placeType: 'Ресторан',
                    icon: UIKit.assets.svg.restaurant(
                      color: UIKit.colors.greenF50,
                    ),
                    isActive: filter.categories.contains(SightType.restaurant),
                    onPressed: () {
                      setState(() {
                        filter = filter.toggleCategory(SightType.restaurant);
                      });
                      // ignore: avoid_print
                      print(filter.categories);
                    },
                  ),
                  FilterTile(
                    placeType: 'Особое место',
                    icon: UIKit.assets.svg.particular(
                      color: UIKit.colors.greenF50,
                    ),
                    isActive: filter.categories.contains(SightType.particular),
                    onPressed: () {
                      setState(() {
                        filter = filter.toggleCategory(SightType.particular);
                      });
                      // ignore: avoid_print
                      print(filter.categories);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterTile(
                    placeType: 'Парк',
                    icon: UIKit.assets.svg.park(
                      color: UIKit.colors.greenF50,
                    ),
                    isActive: filter.categories.contains(SightType.park),
                    onPressed: () {
                      setState(() {
                        filter = filter.toggleCategory(SightType.park);
                      });
                      // ignore: avoid_print
                      print(filter.categories);
                    },
                  ),
                  FilterTile(
                    placeType: 'Музей',
                    icon: UIKit.assets.svg.museum(
                      color: UIKit.colors.greenF50,
                    ),
                    isActive: filter.categories.contains(SightType.museum),
                    onPressed: () {
                      setState(() {
                        filter = filter.toggleCategory(SightType.museum);
                      });
                      // ignore: avoid_print
                      print(filter.categories);
                    },
                  ),
                  FilterTile(
                    placeType: 'Кафе',
                    icon: UIKit.assets.svg.cafe(
                      color: UIKit.colors.greenF50,
                    ),
                    isActive: filter.categories.contains(SightType.cafe),
                    onPressed: () {
                      setState(() {
                        filter = filter.toggleCategory(SightType.cafe);
                      });
                      // ignore: avoid_print
                      print(filter.categories);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Расстояние',
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
                data: UIKit.themes.sliderTheme,
                child: RangeSlider(
                  values:
                      RangeValues(filter.distance.start, filter.distance.end),
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
          //-----------------------TEST
          // TODO убрать

          Column(
            children: [
              for (Sight sight in mocks)
                if (filter.categories.contains(sight.type)) Text(sight.name),
            ],
          ),

          //-----------------------TEST
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 16,
              right: 16,
            ),
            child: ColoredButton(
              text: 'ПОКАЗАТЬ',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}


/* 
class FiltersInheritedWidget extends InheritedWidget {
  final _FiltersScreenState state;

  const FiltersInheritedWidget({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(FiltersInheritedWidget oldWidget) {
    return oldWidget.state.filter.distance.end != state.filter.distance.end ||
        oldWidget.state.filter.distance.start != state.filter.distance.start ||
        oldWidget.state.filter.categories != state.filter.categories;
  }

  static FiltersInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late Filter filter;

  @override
  void initState() {
    super.initState();
    filter = Filter();
  }

  @override
  Widget build(BuildContext context) {
    return FiltersInheritedWidget(
      state: this,
      child: Scaffold(
        appBar: const _BuildAppBar(),
        body: Column(
          children: const [
            _BuildCategories(),
            SizedBox(height: 60),
            _BuildSlider(),
          ],
        ),
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
    final rootWidgetState = FiltersInheritedWidget.of(context)!.state;

    return SmallAppBar(
      titleWidget: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SightListScreen(),
                  ),
                );
              },
              child: Container(
                height: 32,
                width: 32,
                color: Colors.transparent,
                child: UIKit.assets.svg.back(
                  color: UIKit.colors.primaryBlueE5B,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                rootWidgetState.filter = rootWidgetState.filter.clear();
                // ignore: avoid_print
                print(rootWidgetState.filter.categories);
                // ignore: avoid_print
                print(
                  '${rootWidgetState.filter.distance.start.round()} --- ${rootWidgetState.filter.distance.end.round()}',
                );
              },
              child: Text(
                'Очистить',
                style: theme.primaryTextTheme.headline6!.copyWith(
                  color: UIKit.colors.greenF50,
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
    final rootWidgetState = FiltersInheritedWidget.of(context)!.state;

    return FilterTile(
      placeType: 'Отель',
      icon: UIKit.assets.svg.hotel(
        color: UIKit.colors.greenF50,
      ),
      isActive: rootWidgetState.filter.categories.contains(SightType.hotel),
      onPressed: () {
        rootWidgetState.filter =
            rootWidgetState.filter.toggleCategory(SightType.hotel);

        // ignore: avoid_print
        print(rootWidgetState.filter.categories);
      },
    );
  }
}

class _BuildSlider extends StatefulWidget {
  const _BuildSlider({super.key});

  @override
  State<_BuildSlider> createState() => _BuildSliderState();
}

class _BuildSliderState extends State<_BuildSlider> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rootWidgetState = FiltersInheritedWidget.of(context)!.state;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Расстояние',
                style: theme.primaryTextTheme.headline6,
              ),
              Text(
                'от ${(rootWidgetState.filter.distance.start / 1000).round()} до ${(rootWidgetState.filter.distance.end / 1000).round()} км',
                style: theme.primaryTextTheme.headline6!.copyWith(
                  color: UIKit.colors.primaryLightInactive,
                ),
              ),
            ],
          ),
        ),
        SliderTheme(
          data: UIKit.themes.sliderTheme,
          child: RangeSlider(
            values: RangeValues(
              rootWidgetState.filter.distance.start,
              rootWidgetState.filter.distance.end,
            ),
            max: 30000,
            divisions: 30,
            onChanged: (values) {
              if (values.start.round() >= values.end.round()) return;
              setState(() {
                rootWidgetState.filter = rootWidgetState.filter.copyWith(
                  distance: Range(values.start, values.end),
                );
              });

              // ignore: avoid_print
              print(
                '${rootWidgetState.filter.distance.start.round()} --- ${rootWidgetState.filter.distance.end.round()}',
              );
            },
          ),
        ),
      ],
    );
  }
} */