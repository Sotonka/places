import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/providers/sight_list_provider.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/gradient_button.dart';
import 'package:places/ui/widget/nothing_found.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/sight_list_screen_app_bar.dart';
import 'package:provider/provider.dart';

class SightListScreen extends StatelessWidget {
  const SightListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SightListProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: const CustomAppBar(title: AppStrings.sightListScreenTitle),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SearchBar(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) =>
                              SightSearchScreen(filter: provider.filter),
                        ),
                      );
                    },
                    filters: provider.filterIsActive,
                    onSuffixPressed: () async {
                      provider
                        ..popResult =
                            await Navigator.push<Map<String, dynamic>>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FiltersScreen(
                              filter: provider.filter,
                            ),
                          ),
                        )
                        ..getPopResult();
                    },
                    onSubmit: (_) {},
                  ),
                ),
                const SizedBox(height: 38),
                Expanded(
                  child: provider.sightList.isEmpty
                      ? const NotFound()
                      : CardList(
                          iterable: provider.sightList,
                          type: CardType.list,
                        ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientButton(
                      text: AppStrings.sightListScreenNew,
                      onPressed: () async {
                        context
                            .read<SightListProvider>()
                            .appendSigtList(await Navigator.push<Sight>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddSightScreen(),
                              ),
                            ));
                      },
                      icon: AppIcons.add(
                        height: 18,
                        width: 18,
                        color: AppColors.primaryLightFFF,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(index: 0),
      );
    });
  }
}
