import 'package:flutter/material.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:places/ui/widget/small_app_bar.dart';

class SightSearchScreen extends StatelessWidget {
  const SightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SightSearchScreen();
  }
}

class _SightSearchScreen extends StatelessWidget {
  const _SightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SmallAppBar(
        title: 'Список интересных мест',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 6,
          left: 16,
          right: 16,
        ),
        child: SearchBar(
          onPressed: () {},
          onFilterPressed: () {},
        ),
      ),
    );
  }
}
