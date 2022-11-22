import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/sight_list_screen_app_bar.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: UIKit.strings.sightListScreenTitle),
      body: ListView.separated(
        itemCount: mocks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return SightCard(
            sight: mocks[index],
            type: CardType.list,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRouter.filterScreen,
          );
        },
        child: const Text('filters'),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}
