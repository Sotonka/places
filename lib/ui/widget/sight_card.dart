import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) => SightDetails(
                sight: sight,
              ),
            ),
          );
        },
        child: AspectRatio(
          aspectRatio: 1.5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Stack(
              children: [
                Container(
                  color: Theme.of(context).brightness == Brightness.light
                      ? UIKit.colors.primaryLight5F5
                      : UIKit.colors.primaryDarkA20,
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
              ],
            ),
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
        const LoadableImage(
          url:
              'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
        ),
        Positioned(
          left: 16,
          top: 16,
          child: Text(
            sight.typeAsText,
            style: UIKit.fonts.bold14.copyWith(
              color: UIKit.colors.primaryLightFFF,
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: type == CardType.list
              ? UIKit.assets.svg.heart(
                  color: UIKit.colors.primaryLightFFF,
                )
              : Row(
                  children: type == CardType.wishlist
                      ? [
                          UIKit.assets.svg.calendar(
                            color: UIKit.colors.primaryLightFFF,
                          ),
                          const SizedBox(width: 16),
                          UIKit.assets.svg.close(
                            color: UIKit.colors.primaryLightFFF,
                          ),
                        ]
                      : [
                          UIKit.assets.svg.share(
                            color: Colors.white,
                          ),
                          const SizedBox(width: 16),
                          UIKit.assets.svg.close(
                            color: UIKit.colors.primaryLightFFF,
                          ),
                        ],
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
                style: Theme.of(context).primaryTextTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 2),
            Flexible(
              child: Text(
                sight.details,
                style: UIKit.fonts.normal14.copyWith(
                  color: UIKit.colors.primaryLightE92,
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
