import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/loadable_image.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        aspectRatio: 3 / 2,
        child: Card(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          color: UIKit.colors.cardBackground,
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Stack(
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _TopCardPart(sight: sight),
                    _BottomCardPart(sight: sight),
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

class _TopCardPart extends StatelessWidget {
  final Sight sight;
  const _TopCardPart({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: (MediaQuery.of(context).size.width / 2 - 16) * 2 / 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // пока url оставил тут
          const LoadableImage(
            url:
                'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Text(
              sight.typeAsText,
              style: UIKit.fonts.sightType14,
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: InkWell(
              onTap: () {},
              child: UIKit.assets.svg.heart(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCardPart extends StatelessWidget {
  final Sight sight;
  const _BottomCardPart({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // некрасиво, но это потом переделаю
      height: (MediaQuery.of(context).size.width / 2 - 16) * 2 / 3,
      padding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 2 - 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                sight.name,
                style: UIKit.fonts.sightName16,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Flexible(
              child: Text(
                sight.details,
                style: UIKit.fonts.normal14,
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
