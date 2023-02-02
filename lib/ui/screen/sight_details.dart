import 'package:flutter/material.dart';
import 'package:places/ui/providers/sight_details_provider.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/loadable_image.dart';
import 'package:places/ui/widget/transparent_button.dart';
import 'package:places/utils/utils.dart';
import 'package:provider/provider.dart';

class SightDetails extends StatefulWidget {
  final String id;

  const SightDetails({super.key, required this.id});

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
    final sight = Utils().getById(widget.id);

    return Consumer<SightDetailsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 360,
                    flexibleSpace: Stack(
                      children: [
                        Container(
                          color: themeColors.sightDetails,
                          child: PageView(
                            onPageChanged: (page) {
                              provider.page = page;
                            },
                            children: [
                              LoadableImage(
                                url: sight.url,
                              ),
                              LoadableImage(
                                url: sight.url,
                              ),
                              LoadableImage(
                                url: sight.url,
                              ),
                              LoadableImage(
                                url: sight.url,
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
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
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
                                sight.name,
                                style: AppTextStyle.bold24,
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    sight.typeAsText,
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
                              //TODO
                              //для контроля
                              Text(
                                sight.visitDate.toString(),
                                style: AppTextStyle.normal14.copyWith(
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                sight.details,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 1000,
                                color: Colors.yellow.withOpacity(0.2),
                                child: Text(
                                  'LONG CONTENT',
                                  style: AppTextStyle.bold24,
                                ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: TransparentButton(
                                      text:
                                          AppStrings.sightDetailsScreenSchedule,
                                      onPressed: () {},
                                      isActive: false,
                                      icon: AppIcons.calendar(
                                        color: AppColors.primaryLightInactive,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TransparentButton(
                                      text:
                                          AppStrings.sightDetailsScreenFavorite,
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
                ],
              ),
              const Positioned(
                top: 16,
                right: 16,
                child: _BuildClose(),
              ),
            ],
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
              borderRadius: page == 0
                  ? const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    )
                  : page == itemCount - 1
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        )
                      : BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildClose extends StatelessWidget {
  const _BuildClose();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.primaryLightFFF,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: AppIcons.close(
            color: AppColors.primaryBlueE5B,
          ),
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}
