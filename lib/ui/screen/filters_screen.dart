import 'package:flutter/material.dart';
import 'package:places/ui/providers/filter_provider.dart';
import 'package:places/ui/providers/sight_list_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/filter_tile.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  void initState() {
    context.read<FilterProvider>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _BuildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const _BuildCategories(),
                const _BuildSlider(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                  child: ColoredButton(
                    isActive: true,
                    text: '${AppStrings.filtersScreenShow} ',
                    onPressed: () {
                      context.read<SightListProvider>().isloading = true;
                      context.read<SightListProvider>().loadFilteredPlaces(
                            context.read<FilterProvider>().filter,
                            context,
                          );
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                ),
              ],
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

  const _BuildAppBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;
    final provider = context.read<FilterProvider>();

    return SmallAppBar(
      titleWidget: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                provider.revertFilter();
                Navigator.of(context).pop();
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
              onTap: provider.clearFilter,
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
  const _BuildCategories();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final categories = <_Category>[
      _Category(
        type: 'hotel',
        name: AppStrings.hotel.capitalize(),
        icon: AppIcons.hotel(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: 'restaurant',
        name: AppStrings.restaurant.capitalize(),
        icon: AppIcons.restaurant(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: 'particular',
        name: AppStrings.particular.capitalize(),
        icon: AppIcons.particular(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: 'park',
        name: AppStrings.park.capitalize(),
        icon: AppIcons.park(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: 'museum',
        name: AppStrings.museum.capitalize(),
        icon: AppIcons.museum(
          color: themeColors.greenAccent,
        ),
      ),
      _Category(
        type: 'cafe',
        name: AppStrings.cafe.capitalize(),
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
        Consumer<FilterProvider>(builder: (context, provider, child) {
          return width <= 480
              ? Wrap(
                  spacing: (width - 192) / 3,
                  alignment: WrapAlignment.center,
                  runSpacing: 40,
                  children: [
                    for (var element in categories)
                      FilterTile(
                        placeType: element.name,
                        icon: element.icon,
                        isActive:
                            provider.filterContains(element.type.toString()),
                        onPressed: () {
                          provider.filterToggle(element.type.toString());
                        },
                      ),
                  ],
                )
              : SizedBox(
                  height: 95,
                  child: PageView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 0; i < 3; i++)
                            FilterTile(
                              placeType: categories[i].name,
                              icon: categories[i].icon,
                              isActive: provider.filterContains(
                                categories[i].type.toString(),
                              ),
                              onPressed: () {
                                provider.filterToggle(
                                  categories[i].type.toString(),
                                );
                              },
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int i = 3; i < categories.length; i++)
                            FilterTile(
                              placeType: categories[i].name,
                              icon: categories[i].icon,
                              isActive: provider.filterContains(
                                categories[i].type.toString(),
                              ),
                              onPressed: () {
                                provider.filterToggle(
                                  categories[i].type.toString(),
                                );
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                );
        }),
      ],
    );
  }
}

class _BuildSlider extends StatelessWidget {
  const _BuildSlider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Consumer<FilterProvider>(builder: (context, provider, child) {
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
                  '${AppStrings.filtersScreenFrom} 0 ${AppStrings.filtersScreenTo} ${provider.distanceEnd} ${AppStrings.filtersScreenKm}',
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
                0,
                provider.filter.radius,
              ),
              max: 30000,
              divisions: 30,
              onChanged: (values) {
                if (values.start.round() >= values.end.round()) return;
                provider.updateRange(values.end);
              },
            ),
          ),
        ],
      );
    });
  }
}

class _Category {
  String type;
  String name;
  Widget icon;

  _Category({
    required this.type,
    required this.name,
    required this.icon,
  });
}
