import 'package:flutter/material.dart';
import 'package:places/domain/settings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/providers/visiting_screen_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/nothing_found.dart';
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
                if (provider.wishlistList.isEmpty)
                  const Tab(
                    child: Center(child: NotFound()),
                  )
                else
                  Tab(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        key: ValueKey('value$index'),
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _DismissibleItem(
                          index: index,
                          isVisited: false,
                        ),
                      ),
                      itemCount: provider.wishlistList.length,
                    ),
                  ),
                if (provider.visitedList.isEmpty)
                  const Tab(
                    child: Center(child: NotFound()),
                  )
                else
                  Tab(
                    child: ReorderableListView.builder(
                      itemBuilder: (context, index) => Padding(
                        key: ValueKey('value$index'),
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _DismissibleItem(
                          index: index,
                          isVisited: true,
                        ),
                      ),
                      itemCount: provider.visitedList.length,
                      onReorder: (oldIndex, newIndex) {
                        provider.reorderVisited(oldIndex, newIndex);
                      },
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
    var visitDate = provider.visitedList.elementAt(index).visitDate;
    final visitedSight = provider.visitedList.elementAt(index);
    final wishSight = provider.wishlistList.elementAt(index);
    final today = DateTime.now();

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
                    visitedSight,
                  )
                : provider.removeFromWishlist(
                    wishSight,
                  );
          },
          child: SightCard(
            onCalendarPressed: () async {
              visitDate = await showDatePicker(
                locale: const Locale('ru', 'RU'),
                builder: (context, child) {
                  return Theme(
                    data: theme.copyWith(
                      colorScheme: Settings.themeIsLight.value
                          ? ColorScheme.light(
                              primary: themeColors.greenAccent!,
                              secondary: themeColors.icons!,
                            )
                          : ColorScheme.dark(
                              primary: themeColors.greenAccent!,
                              secondary: themeColors.icons!,
                            ),
                    ),
                    child: child!,
                  );
                },
                cancelText: AppStrings.visitingScreenCancel,
                confirmText: AppStrings.visitingScreenOk,
                context: context,
                initialDate: visitDate ?? today,
                firstDate: visitDate != null && visitDate!.isBefore(today)
                    ? visitDate!
                    : DateTime.now(),
                lastDate: DateTime(today.year + 10, 12, 31),
              );

              if (visitDate != null) {
                final newSight = visitedSight.copyWith(visitDate: visitDate);
                replaceSight(visitedSight.id, newSight);
              }
            },
            sight: isVisited ? visitedSight : wishSight,
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
