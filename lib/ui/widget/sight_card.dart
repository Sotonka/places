import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/loadable_image.dart';

enum CardType { list, wishlist, visited }

class SightCard extends StatelessWidget {
  /// [sight] - модель места,
  /// [type] - тип карточки (list, wishlist, visited) - влияет на отображение
  /// интерфейса - возможных действий с карточкой
  final Sight sight;
  final CardType type;

  final VoidCallback? onClosePressed;
  final VoidCallback? onFavPressed;
  final VoidCallback? onCalendarPressed;
  final VoidCallback? onSharePressed;

  const SightCard({
    super.key,
    required this.sight,
    required this.type,
    this.onClosePressed,
    this.onFavPressed,
    this.onCalendarPressed,
    this.onSharePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
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
                      Radius.circular(12),
                    ),
                  ),
                  onTap: () {
                    /* Navigator.of(context).pushNamed(
                      AppRouter.sightDetailsScreen,
                      arguments: {
                        'id': sight.id,
                      },
                    ); */

                    final maxHeight = MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        40;

                    showModalBottomSheet<void>(
                      context: context,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      isScrollControlled: true,
                      builder: (context) => ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: maxHeight,
                        ),
                        child: SightDetails(id: sight.id),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: type == CardType.list
                    ? InkWell(
                        onTap: onFavPressed,
                        child: AppIcons.heart(
                          color: AppColors.primaryLightFFF,
                        ),
                      )
                    : Row(
                        children: type == CardType.wishlist
                            ? [
                                InkWell(
                                  onTap: onCalendarPressed,
                                  child: AppIcons.calendar(
                                    color: AppColors.primaryLightFFF,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: onClosePressed,
                                  child: AppIcons.close(
                                    color: AppColors.primaryLightFFF,
                                  ),
                                ),
                              ]
                            : [
                                InkWell(
                                  onTap: onSharePressed,
                                  child: AppIcons.share(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: onClosePressed,
                                  child: AppIcons.close(
                                    color: AppColors.primaryLightFFF,
                                  ),
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
