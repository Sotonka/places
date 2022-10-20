import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(400);

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 16,
        left: 16,
        right: 16,
      ).add(
        EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.left,
        maxLines: 2,
        style: UIKit.fonts.appBar32,
      ),
    );
  }
}
