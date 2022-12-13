import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/providers/visiting_screen_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:provider/provider.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VisitingProvider(),
      child: const _VisitingScreen(),
    );
  }
}

class _VisitingScreen extends StatelessWidget {
  const _VisitingScreen();

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
              title: 'Избранное',
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
                            'Хочу посетить',
                            style: AppTextStyle.bold14,
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          child: Text(
                            'Посетил',
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
                Tab(
                  child: CardList(
                    iterable: mocks.where(
                      (element) => element.visitTime != null,
                    ),
                    type: CardType.wishlist,
                  ),
                ),
                Tab(
                  child: CardList(
                    iterable: mocks.where(
                      (element) => element.visited != null,
                    ),
                    type: CardType.visited,
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
