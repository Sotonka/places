import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/providers/filter_provider.dart';
import 'package:places/ui/providers/search_provider.dart';
import 'package:places/ui/providers/sight_list_provider.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/gradient_button.dart';
import 'package:places/ui/widget/nothing_found.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:provider/provider.dart';

class SightListScreen extends StatelessWidget {
  const SightListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SightListProvider>(builder: (context, provider, child) {
      final orientation = MediaQuery.of(context).orientation;

      return Scaffold(
        body: CustomScrollView(
          slivers: [
            if (orientation == Orientation.portrait)
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTitleDelegate(
                  systemBarHeight: MediaQuery.of(context).padding.top,
                  bigTitleStyle: theme.primaryTextTheme.headline1!,
                  smallTitleStyle: theme.primaryTextTheme.headline3!,
                  context: context,
                ),
              )
            else
              SliverPersistentHeader(
                pinned: true,
                delegate: _LandscapeSliverTitleDelegate(
                  systemBarHeight: MediaQuery.of(context).padding.top,
                  bigTitleStyle: theme.primaryTextTheme.headline1!,
                  smallTitleStyle: theme.primaryTextTheme.headline3!,
                  context: context,
                ),
              ),
            if (provider.sightList.isEmpty)
              const NotFound()
            else
              SliverCardList(
                iterable: provider.sightList,
                type: CardType.list,
              ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientButton(
              text: AppStrings.sightListScreenNew,
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
        bottomNavigationBar: const BottomNavBar(index: 0),
      );
    });
  }
}

class _SliverTitleDelegate extends SliverPersistentHeaderDelegate {
  static const bigTitleOffset = 40;

  final double systemBarHeight;
  final TextStyle bigTitleStyle;
  final TextStyle smallTitleStyle;
  final double bigTitleHeight;
  final double smallTitleHeight;
  final BuildContext context;

  @override
  double get maxExtent =>
      systemBarHeight + bigTitleOffset + bigTitleHeight * 2 + 30 + 48 + 16;

  @override
  double get minExtent => systemBarHeight + smallTitleHeight + 30;

  _SliverTitleDelegate({
    required this.systemBarHeight,
    required this.bigTitleStyle,
    required this.smallTitleStyle,
    required this.context,
  })  : bigTitleHeight = bigTitleStyle.fontSize! * bigTitleStyle.height!,
        smallTitleHeight = smallTitleStyle.fontSize! * smallTitleStyle.height!;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final flexibleSpace = bigTitleOffset + bigTitleHeight;
    final k = shrinkOffset >= flexibleSpace
        ? 0.0
        : (flexibleSpace - shrinkOffset) / flexibleSpace;
    final theme = Theme.of(context);

    return Container(
      color: theme.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: systemBarHeight + k * bigTitleOffset + 16,
          ),
          Align(
            alignment: Alignment(lerpDouble(0, -1, k)!, 0),
            child: SizedBox(
              height: smallTitleHeight +
                  (bigTitleHeight * 2 - smallTitleHeight) * k,
              child: Text(
                shrinkOffset > 0
                    ? 'Список интересных мест'
                    : 'Список\nинтересных мест',
                style: TextStyle.lerp(smallTitleStyle, bigTitleStyle, k),
              ),
            ),
          ),
          if (shrinkOffset > 88)
            const SizedBox.shrink()
          else
            Column(
              children: [
                const SizedBox(height: 30),
                Consumer<FilterProvider>(
                  builder: (context, filterProvider, child) {
                    return SearchBar(
                      onPressed: () {
                        context.read<SearchProvider>().refreshSightList(
                              filteredList:
                                  context.read<FilterProvider>().filteredPlaces,
                              isActive: context
                                  .read<FilterProvider>()
                                  .isFilterActive(),
                            );
                        Navigator.of(context).pushNamed(
                          AppRouter.searchScreen,
                        );
                      },
                      filters: filterProvider.isFilterActive(),
                      onSuffixPressed: () async {
                        await Navigator.of(context)
                            .pushNamed(
                              AppRouter.filterScreen,
                            )
                            .then((_) => context
                                .read<SightListProvider>()
                                .refreshSightList(
                                  filteredList: filterProvider.filteredPlaces,
                                  isActive: filterProvider.isFilterActive(),
                                ));
                      },
                      onSubmit: (_) {},
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _LandscapeSliverTitleDelegate extends SliverPersistentHeaderDelegate {
  static const bigTitleOffset = 40;

  final double systemBarHeight;
  final TextStyle bigTitleStyle;
  final TextStyle smallTitleStyle;
  final double bigTitleHeight;
  final double smallTitleHeight;
  final BuildContext context;

  @override
  double get maxExtent =>
      systemBarHeight + smallTitleHeight + 30 + 25 + 40 + 14;

  @override
  double get minExtent =>
      systemBarHeight + smallTitleHeight + 30 + 25 + 40 + 14;

  _LandscapeSliverTitleDelegate({
    required this.systemBarHeight,
    required this.bigTitleStyle,
    required this.smallTitleStyle,
    required this.context,
  })  : bigTitleHeight = bigTitleStyle.fontSize! * bigTitleStyle.height!,
        smallTitleHeight = smallTitleStyle.fontSize! * smallTitleStyle.height!;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    return Container(
      color: theme.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SizedBox(
            height: systemBarHeight + 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' Список интересных мест',
              style: smallTitleStyle,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              Consumer<FilterProvider>(
                builder: (context, filterProvider, child) {
                  return SearchBar(
                    onPressed: () {
                      context.read<SearchProvider>().refreshSightList(
                            filteredList:
                                context.read<FilterProvider>().filteredPlaces,
                            isActive:
                                context.read<FilterProvider>().isFilterActive(),
                          );
                      Navigator.of(context).pushNamed(
                        AppRouter.searchScreen,
                      );
                    },
                    filters: filterProvider.isFilterActive(),
                    onSuffixPressed: () async {
                      await Navigator.of(context)
                          .pushNamed(
                            AppRouter.filterScreen,
                          )
                          .then((_) => context
                              .read<SightListProvider>()
                              .refreshSightList(
                                filteredList: filterProvider.filteredPlaces,
                                isActive: filterProvider.isFilterActive(),
                              ));
                    },
                    onSubmit: (_) {},
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
