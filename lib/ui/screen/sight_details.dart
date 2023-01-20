import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/providers/sight_details_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/loadable_image.dart';
import 'package:places/ui/widget/transparent_button.dart';
import 'package:provider/provider.dart';

class SightDetails extends StatefulWidget {
  final Sight sight;

  const SightDetails({super.key, required this.sight});

  @override
  State<SightDetails> createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  void initState() {
    Provider.of<SightDetailsProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Consumer<SightDetailsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      color: themeColors.sightDetails,
                      height: 360,
                      child: PageView(
                        onPageChanged: (page) {
                          provider.page = page;
                        },
                        children: [
                          LoadableImage(
                            url: widget.sight.url,
                          ),
                          LoadableImage(
                            url: widget.sight.url,
                          ),
                          LoadableImage(
                            url: widget.sight.url,
                          ),
                          LoadableImage(
                            url: widget.sight.url,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      child: _Indicator(
                        itemCount: 4,
                        page: provider.page,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.sight.name,
                        style: AppTextStyle.bold24,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            widget.sight.typeAsText,
                            style: theme.primaryTextTheme.bodyText1,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'закрыто до 09:00',
                            style: AppTextStyle.normal14.copyWith(
                              color: AppColors.primaryLightE92,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        widget.sight.details,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                      const SizedBox(height: 24),
                      ColoredButton(
                        text: AppStrings.sightDetailsScreenRoute,
                        onPressed: () {},
                        icon: AppIcons.route(
                          color: AppColors.primaryLightFFF,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Divider(
                        height: 0,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: TransparentButton(
                              text: AppStrings.sightDetailsScreenSchedule,
                              onPressed: () {},
                              isActive: false,
                              icon: AppIcons.calendar(
                                color: AppColors.primaryLightInactive,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TransparentButton(
                              text: AppStrings.sightDetailsScreenFavorite,
                              onPressed: () {},
                              isActive: true,
                              icon: AppIcons.heart(
                                color: themeColors.icons,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Indicator extends StatelessWidget {
  final int itemCount;
  final int page;
  const _Indicator({required this.itemCount, required this.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;
    final tabSize = MediaQuery.of(context).size.width / itemCount;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(),
        Positioned(
          left: tabSize * page,
          child: Container(
            height: 8,
            width: tabSize,
            decoration: BoxDecoration(
              color: themeColors.icons,
              borderRadius: () {
                if (page == 0) {
                  return const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  );
                } else if (page == itemCount - 1) {
                  return const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  );
                } else {
                  return BorderRadius.circular(8);
                }
              }(),
            ),
          ),
        ),
      ],
    );
  }
}
