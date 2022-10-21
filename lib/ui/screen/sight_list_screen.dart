import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
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
      body: ListView(
        children: [
          for (final sight in mocks)
            SightCard(
              sight: sight,
            ),
        ],
      ),
    );
  }
}
