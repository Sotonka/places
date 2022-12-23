import 'package:flutter/material.dart';
import 'package:places/ui/providers/visiting_screen_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:provider/provider.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Consumer<VisitingProvider>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: SmallAppBar(
              title: AppStrings.visitingScreenFav,
              bottom: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: themeColors.sightCard,
                    ),
                  ),
                  TabBar(
                    unselectedLabelColor: AppColors.primaryLightE92,
                    labelColor: themeColors.tabSwitchText,
                    indicatorSize: TabBarIndicatorSize.tab,
                    splashFactory: NoSplash.splashFactory,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: themeColors.tabSwitch,
                    ),
                    tabs: [
                      Tab(
                        child: Align(
                          child: Text(
                            AppStrings.visitingScreenWant,
                            style: AppTextStyle.bold14,
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          child: Text(
                            AppStrings.visitingScreenDone,
                            style: AppTextStyle.bold14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // TODO
                ///
                ///
                ///
                /// не работает draggable
                ///
                ///
                Tab(
                  child: ReorderableListView.builder(
                    itemBuilder: (context, index) => Padding(
                      key: ValueKey('$index'),
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _DismissibleItem(
                        index: index,
                        isVisited: false,
                      ),
                    ),
                    itemCount: provider.wishlistList.length,
                    onReorder: (oldIndex, newIndex) {
                      provider.reorder(oldIndex, newIndex);
                    },
                  ),

                  /* ListView.separated(
                    itemCount: provider.wishlistList.length,
                    itemBuilder: (context, index) => _DismissibleItem(
                      index: index,
                      isVisited: false,
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 16,
                    ),
                  ), */
                ),
                Tab(
                  child: ListView.separated(
                    itemCount: provider.visitedList.length,
                    itemBuilder: (context, index) => _DismissibleItem(
                      index: index,
                      isVisited: true,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const BottomNavBar(index: 2),
          ),
        );
      },
    );
  }
}

class _DismissibleItem extends StatelessWidget {
  final int index;
  final bool isVisited;
  const _DismissibleItem({
    required this.index,
    required this.isVisited,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;
    final provider = context.read<VisitingProvider>();

    return Stack(
      children: [
        Container(
          height: (MediaQuery.of(context).size.width - 32) / 3 * 2,
          decoration: BoxDecoration(
            color: themeColors.error,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcons.bucket(
                  color: AppColors.primaryLightFFF,
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.visitingScreenDelete,
                  style: theme.primaryTextTheme.bodyText2!.copyWith(
                    color: AppColors.primaryLightFFF,
                  ),
                ),
              ],
            ),
          ),
        ),
        Dismissible(
          direction: DismissDirection.endToStart,
          dismissThresholds: const {
            DismissDirection.endToStart: 0.2,
          },
          key: UniqueKey(),
          onDismissed: (_) {
            isVisited
                ? provider.removeFromVisited(
                    provider.visitedList.elementAt(index),
                  )
                : provider.removeFromWishlist(
                    provider.wishlistList.elementAt(index),
                  );
          },
          child: SightCard(
            sight: isVisited
                ? provider.visitedList.elementAt(index)
                : provider.wishlistList.elementAt(index),
            type: isVisited ? CardType.visited : CardType.wishlist,
            onClosePressed: () {
              isVisited
                  ? provider.removeFromVisited(
                      provider.visitedList.elementAt(index),
                    )
                  : provider.removeFromWishlist(
                      provider.wishlistList.elementAt(index),
                    );
            },
          ),
        ),
      ],
    );
  }
}
