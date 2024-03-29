import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/bloc/favourites/favourites_bloc.dart';
import 'package:places/bloc/visited/visited_bloc.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/providers/visiting_screen_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/date_pickers.dart';
import 'package:places/ui/widget/nothing_found.dart';
import 'package:places/ui/widget/progress_indicator.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:provider/provider.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({super.key});

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<FavouritesBloc>().add(
          const FavouritesEvent.loadFavourites(),
        );

    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        context.read<FavouritesBloc>().add(
              const FavouritesEvent.loadFavourites(),
            );
      } else if (_tabController.index == 1) {
        context.read<VisitedBloc>().add(
              const VisitedEvent.loadVisited(),
            );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
              title: AppStrings.visitingScreenFav,
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
                    controller: _tabController,
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
                            AppStrings.visitingScreenWant,
                            style: AppTextStyle.bold14,
                          ),
                        ),
                      ),
                      Tab(
                        child: Align(
                          child: Text(
                            AppStrings.visitingScreenDone,
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
              controller: _tabController,
              children: [
                Tab(
                  child: BlocBuilder<FavouritesBloc, FavouritesState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return const CustomProgress();
                        },
                        loaded: (placesList) {
                          return placesList.isEmpty
                              ? const Center(child: NotFound())
                              : ListView.builder(
                                  itemBuilder: (context, index) => Padding(
                                    key: ValueKey('value$index'),
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: _DismissibleItem(
                                      index: index,
                                      isVisited: false,
                                      place: placesList[index],
                                    ),
                                  ),
                                  itemCount: placesList.length,
                                );
                        },
                      );
                    },
                  ),
                ),
                Tab(
                  child: BlocBuilder<VisitedBloc, VisitedState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return const CustomProgress();
                        },
                        loaded: (placesList) {
                          return placesList.isEmpty
                              ? const Center(child: NotFound())
                              : ListView.builder(
                                  itemBuilder: (context, index) => Padding(
                                    key: ValueKey('value$index'),
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: _DismissibleItem(
                                      index: index,
                                      isVisited: false,
                                      place: placesList[index],
                                    ),
                                  ),
                                  itemCount: placesList.length,
                                );
                        },
                      );
                    },
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

class _DismissibleItem extends StatelessWidget {
  final int index;
  final bool isVisited;
  final Place place;

  const _DismissibleItem({
    required this.index,
    required this.isVisited,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;
    final provider = context.read<VisitingProvider>();

    var visitDate = DateTime.now();
    final today = DateTime.now();

    return Stack(
      children: [
        Container(
          height: (MediaQuery.of(context).size.width - 32) / 3 * 2,
          decoration: BoxDecoration(
            color: themeColors.error,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcons.bucket(
                  color: AppColors.primaryLightFFF,
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.visitingScreenDelete,
                  style: theme.primaryTextTheme.bodyText2!.copyWith(
                    color: AppColors.primaryLightFFF,
                  ),
                ),
              ],
            ),
          ),
        ),
        Dismissible(
          direction: DismissDirection.endToStart,
          dismissThresholds: const {
            DismissDirection.endToStart: 0.2,
          },
          key: UniqueKey(),
          onDismissed: (_) {
            isVisited
                ? provider.removeFromVisited(
                    place,
                  )
                : provider.removeFromFavourite(
                    place,
                  );
          },
          child: SightCard(
            onCalendarPressed: () async {
              visitDate = (Platform.isIOS
                  ? await showCupertinoDatePicker(
                      context: context,
                      initialDate: visitDate,
                      firstDate: visitDate.isBefore(today) ? visitDate : today,
                    )
                  : await datePicker(
                      context: context,
                      initialDate: visitDate,
                      firstDate: visitDate.isBefore(today)
                          ? visitDate
                          : DateTime.now(),
                      lastDate: DateTime(today.year + 10, 12, 31),
                    ))!;

              // TODO
              // при нажатии на календарь -> отмена - краш (исправлю при создании БД)

              // TODO

              /*  if (visitDate != null) {
                final newSight = visitedSight.copyWith(visitDate: visitDate);
                replaceSight(visitedSight.id, newSight);
              }  */
            },
            //sight: isVisited ? visitedPlace : favouritePlace,
            place: place,
            type: isVisited ? CardType.visited : CardType.wishlist,
            onClosePressed: () {
              isVisited
                  ? provider.removeFromVisited(
                      provider.visitedPlaces.elementAt(index),
                    )
                  : provider.removeFromFavourite(
                      provider.favouritePlaces.elementAt(index),
                    );
            },
          ),
        ),
      ],
    );
  }
}
