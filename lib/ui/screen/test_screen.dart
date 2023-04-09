import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:places/mobx_store/place_store.dart';
import 'package:places/ui/providers/filter_provider.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/nothing_found.dart';
import 'package:places/ui/widget/progress_indicator.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _store = PlaceStore();
  @override
  void initState() {
    super.initState();
    _store.getPlaces(context.read<FilterProvider>().filter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return CustomScrollView(
          slivers: [
            if (_store.isLoading)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: CustomProgress(),
                ),
              )
            else if (_store.places.isEmpty)
              const SliverToBoxAdapter(
                child: NotFound(),
              )
            else
              SliverCardList(
                iterable: _store.places,
                type: CardType.list,
              ),
          ],
        );
      }),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}
