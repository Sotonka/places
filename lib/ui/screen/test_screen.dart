import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filters.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/providers/filter_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/gradient_button.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final placesController = StreamController<List<Place>?>();
  List<Place>? lastPlaces;

  @override
  void initState() {
    super.initState();

    final filter = context.read<FilterProvider>().filter;

    reloadPlaces(filter);
  }

  @override
  void dispose() {
    placesController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Place>?>(
        stream: placesController.stream,
        builder: (context, snapshot) {
          lastPlaces ??= snapshot.data;

          return lastPlaces == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomScrollView(
                  slivers: [
                    SliverCardList(
                      iterable: lastPlaces ?? [],
                      type: CardType.list,
                    ),
                  ],
                );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientButton(
            text: 'ОБНОВИТЬ',
            onPressed: () {
              placesController.add(null);
              lastPlaces = null;
              reloadPlaces(context.read<FilterProvider>().filter);
            },
            icon: AppIcons.add(
              height: 18,
              width: 18,
              color: AppColors.primaryLightFFF,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }

  Future<void> reloadPlaces(Filter filter) async {
    placesController.add(null);
    await Future<void>.delayed(const Duration(milliseconds: 1000));

    final places = await PlaceInteractor().getFilteredPlaces(filter);
    // id 530 нет какого-то обязательного параметра, крашит программу, пусть пока так
    final sortedPlaces = <Place>[];
    /* for (final place in places) {
      if (place.id != 530) {
        sortedPlaces.add(place);
      }
    } */
    placesController.add(sortedPlaces);
  }
}
