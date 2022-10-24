import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:places/ui/widget/tab_switch.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({super.key});

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmallAppBar(
        title: 'Избранное',
        bottom: TabSwitch(
          tabs: const ['Хочу посетить', 'Посетил'],
          tabController: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
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
    );
  }
}
