import 'package:flutter/material.dart';
import 'package:places/mocks.dart';

import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/sight_cards.dart';
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
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: UIKit.strings.sightListScreenTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView.separated(
          itemCount: mocks.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return ListCard(
              sight: mocks[index],
            );
          },
        ),
      ),
    );
  }
}
