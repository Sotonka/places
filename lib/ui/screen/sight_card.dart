import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

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
              height: 188,
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
      height: 96,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
            fit: BoxFit.cover,
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          text: TextSpan(
            text: '${sight.name}\n',
            style: UIKit.fonts.sightName16,
            children: [
              TextSpan(
                text: '${sight.details}\n',
                style: UIKit.fonts.normal14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
