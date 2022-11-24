import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/loadable_image.dart';

enum CardType { list, wishlist, visited }

class SightCard extends StatelessWidget {
  final Sight sight;
  final CardType type;

  const SightCard({
    super.key,
    required this.sight,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: Stack(
            children: [
              Container(
                color: themeColors.sightCard,
              ),
              Column(
                children: [
                  Expanded(
                    child: _TopPart(
                      sight: sight,
                      type: type,
                    ),
                  ),
                  Expanded(
                    child: _BottomPart(sight: sight),
                  ),
                ],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: AppColors.splash4C4,
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRouter.sightDetails,
                      arguments: {
                        'sight': sight,
                      },
                    );
                  },
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: type == CardType.list
                    ? AppIcons.heart(
                        color: AppColors.primaryLightFFF,
                      )
                    : Row(
                        children: type == CardType.wishlist
                            ? [
                                AppIcons.calendar(
                                  color: AppColors.primaryLightFFF,
                                ),
                                const SizedBox(width: 16),
                                AppIcons.close(
                                  color: AppColors.primaryLightFFF,
                                ),
                              ]
                            : [
                                AppIcons.share(
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 16),
                                AppIcons.close(
                                  color: AppColors.primaryLightFFF,
                                ),
                              ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopPart extends StatelessWidget {
  final Sight sight;
  final CardType type;

  const _TopPart({
    super.key,
    required this.sight,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        LoadableImage(
          url: sight.url,
        ),
        Positioned(
          left: 16,
          top: 16,
          child: Text(
            sight.typeAsText,
            style: AppTextStyle.bold14.copyWith(
              color: AppColors.primaryLightFFF,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomPart extends StatelessWidget {
  final Sight sight;
  const _BottomPart({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: (MediaQuery.of(context).size.width - 32) / 1.3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                sight.name,
                style: theme.primaryTextTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 2),
            Flexible(
              child: Text(
                sight.details,
                style: AppTextStyle.normal14.copyWith(
                  color: AppColors.primaryLightE92,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
