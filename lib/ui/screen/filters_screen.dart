import 'package:flutter/material.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
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
  bool cafeIsAcive = false;
  bool hotelIsAcive = false;
  bool restaurantIsAcive = false;
  bool particularIsAcive = false;
  bool parkIsAcive = false;
  bool museumIsAcive = false;

  @override
  void initState() {
    super.initState();
    filter = Filter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _BuildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'КАТЕГОРИИ',
                    style: UIKit.fonts.normal12.copyWith(
                      color: UIKit.colors.primaryLightInactive,
                    ),
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
                    isActive: hotelIsAcive,
                    onPressed: () {
                      setState(() {
                        hotelIsAcive = !hotelIsAcive;
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
                    isActive: restaurantIsAcive,
                    onPressed: () {
                      setState(() {
                        restaurantIsAcive = !restaurantIsAcive;
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
                    isActive: particularIsAcive,
                    onPressed: () {
                      setState(() {
                        particularIsAcive = !particularIsAcive;
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
                    isActive: parkIsAcive,
                    onPressed: () {
                      setState(() {
                        parkIsAcive = !parkIsAcive;
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
                    isActive: museumIsAcive,
                    onPressed: () {
                      setState(() {
                        museumIsAcive = !museumIsAcive;
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
                    isActive: cafeIsAcive,
                    onPressed: () {
                      setState(() {
                        cafeIsAcive = !cafeIsAcive;
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
                      style: UIKit.fonts.middle16,
                    ),
                    Text(
                      'от ${(filter.distance.start / 1000).round()} до ${(filter.distance.end / 1000).round()} км',
                      style: UIKit.fonts.middle16.copyWith(
                        color: UIKit.colors.primaryLightInactive,
                      ),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  disabledThumbColor: Colors.white,
                  trackHeight: 2,
                  thumbColor: Colors.white,
                  inactiveTrackColor: UIKit.colors.primaryLightInactive,
                  activeTrackColor: UIKit.colors.greenF50,
                  rangeTrackShape: const RectangularRangeSliderTrackShape(),
                  rangeThumbShape: const RoundRangeSliderThumbShape(
                    enabledThumbRadius: 8,
                    elevation: 2,
                  ),
                ),
                child: RangeSlider(
                  values:
                      RangeValues(filter.distance.start, filter.distance.end),
                  max: 30000,
                  divisions: 30,
                  //activeColor: UIKit.colors.greenF50,
                  //inactiveColor: UIKit.colors.primaryLightInactive,
                  onChanged: (values) {
                    if (values.start.round() >= values.end.round()) return;
                    setState(() {
                      filter = filter.copyWith(
                        distance: Range(values.start, values.end),
                      );
                    });
                    // ignore: avoid_print
                    print(
                      '${filter.distance.start.round()} --- ${filter.distance.end.round()}',
                    );
                  },
                ),
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
              text: 'ПОКАЗАТЬ',
              onPressed: () {},
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
                color: Colors.white,
                child: UIKit.assets.svg.back(
                  color: UIKit.colors.primaryBlueE5B,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
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
