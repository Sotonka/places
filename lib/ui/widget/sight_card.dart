import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/providers/visiting_screen_provider.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/loadable_image.dart';
import 'package:provider/provider.dart';

enum CardType { list, wishlist, visited }

class SightCard extends StatefulWidget {
  final Place place;
  final CardType type;

  final VoidCallback? onClosePressed;
  final VoidCallback? onCalendarPressed;
  final VoidCallback? onSharePressed;

  const SightCard({
    super.key,
    required this.place,
    required this.type,
    this.onClosePressed,
    this.onCalendarPressed,
    this.onSharePressed,
  });

  @override
  State<SightCard> createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {
  bool _isInFav = false;

  @override
  void initState() {
    _isInFav = context.read<VisitingProvider>().isInFavourite(widget.place);
    super.initState();
  }

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
                      sight: widget.place,
                      type: widget.type,
                    ),
                  ),
                  Expanded(
                    child: _BottomPart(sight: widget.place),
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
                        child: SightDetails(id: widget.place.id),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: widget.type == CardType.list
                    ? InkWell(
                        onTap: () {
                          _isInFav
                              ? context
                                  .read<VisitingProvider>()
                                  .removeFromFavourite(widget.place)
                              : context
                                  .read<VisitingProvider>()
                                  .addToFavourite(widget.place);
                          setState(() {
                            _isInFav = !_isInFav;
                          });
                        },
                        child: _isInFav
                            ? AppIcons.heartFull(
                                color: AppColors.primaryLightFFF,
                              )
                            : AppIcons.heart(
                                color: AppColors.primaryLightFFF,
                              ),
                      )
                    : Row(
                        children: widget.type == CardType.wishlist
                            ? [
                                InkWell(
                                  onTap: widget.onCalendarPressed,
                                  child: AppIcons.calendar(
                                    color: AppColors.primaryLightFFF,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: widget.onClosePressed,
                                  child: AppIcons.close(
                                    color: AppColors.primaryLightFFF,
                                  ),
                                ),
                              ]
                            : [
                                InkWell(
                                  onTap: widget.onSharePressed,
                                  child: AppIcons.share(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  onTap: widget.onClosePressed,
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
  final Place sight;
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
          url: sight.urls,
        ),
        Positioned(
          left: 16,
          top: 16,
          child: Text(
            // TODO
            //sight.typeAsText,
            sight.placeType,
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
  final Place sight;
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
                sight.description,
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
