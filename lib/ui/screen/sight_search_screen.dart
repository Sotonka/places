import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/providers/search_provider.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/card_list.dart';
import 'package:places/ui/widget/gradient_button.dart';
import 'package:places/ui/widget/nothing_found.dart';
import 'package:places/ui/widget/search_bar.dart';
import 'package:places/ui/widget/sight_card.dart';
import 'package:places/ui/widget/sight_card_tab.dart';
import 'package:places/ui/widget/small_app_bar.dart';
import 'package:provider/provider.dart';

class SightSearchScreen extends StatelessWidget {
  final Filter? filter;
  const SightSearchScreen({super.key, this.filter});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
      ],
      child: _SightSearchScreen(filter: filter),
    );
  }
}

class _SightSearchScreen extends StatefulWidget {
  final Filter? filter;

  const _SightSearchScreen({this.filter});

  @override
  State<_SightSearchScreen> createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<_SightSearchScreen> {
  @override
  void initState() {
    context.read<SearchProvider>().filter = widget.filter;
    context.read<SearchProvider>().updateList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: SmallAppBar(
        titleWidget: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppStrings.searchScreenList,
            textAlign: TextAlign.center,
            style: theme.primaryTextTheme.headline3,
          ),
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  left: 16,
                  right: 16,
                ),
                child: SearchBar(
                  onSubmit: (value) {
                    provider.unfocus();
                  },
                  onChange: (value) {
                    provider.findSights(value);
                  },
                  onComplete: () {
                    provider
                      ..submittedSearch = provider.searchController.text
                      ..unfocus();
                  },
                  controller: provider.searchController,
                  readOnly: false,
                  filters: provider.filterIsActive,
                  focus: provider.searchFocus,
                  suffixClose: provider.searching,
                  onPressed: () {
                    provider.notify();
                  },
                  onSuffixPressed: provider.searching
                      ? () {
                          provider.clearSearch();
                        }
                      : () async {
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
                ),
              ),
              const SizedBox(height: 38),
              const _BuildBody(),
            ],
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return provider.searching
          ? provider.searchInitState
              ? Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 38),
                      Expanded(
                        child: provider.history.isEmpty
                            ? const SizedBox()
                            : const _BuildSearchHistory(),
                      ),
                    ],
                  ),
                )
              : const Expanded(child: _BuildSightList())
          : Expanded(
              child: Stack(
                children: [
                  if (provider.sightList.isEmpty)
                    const Align(
                      child: NotFound(),
                    )
                  else
                    CardList(
                      iterable: provider.sightList,
                      type: CardType.list,
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
                                  .read<SearchProvider>()
                                  .appendSigtList(await Navigator.push<Sight>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AddSightScreen(),
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
            );
    });
  }
}

class _BuildSightList extends StatelessWidget {
  const _BuildSightList();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: provider.searchResult!.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              provider.addHistory(provider.searchResult![index].name);
              Navigator.of(context).pushNamed(
                AppRouter.sightDetails,
                arguments: {
                  'sight': provider.searchResult![index],
                },
              );
            },
            child: SightCardTab(
              sight: provider.searchResult![index],
              search: [provider.searchController.text],
            ),
          ),
        ),
      );
    });
  }
}

class _BuildSearchHistory extends StatelessWidget {
  const _BuildSearchHistory();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Consumer<SearchProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.searchScreenName,
                style: theme.primaryTextTheme.bodyText2,
              ),
            ),
            const SizedBox(height: 19),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: provider.history.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 13,
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            provider
                                .setSearchController(provider.history[index]);
                          },
                          child: Text(
                            provider.history[index],
                            style: AppTextStyle.middle16.copyWith(
                              color: AppColors.primaryLightE92,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            provider.removeAtHistory(index);
                          },
                          child: AppIcons.close(
                            color: AppColors.primaryLightE92,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: provider.clearHistory,
                child: Text(
                  AppStrings.searchScreenClear,
                  style: theme.primaryTextTheme.headline6!.copyWith(
                    color: themeColors.greenAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
