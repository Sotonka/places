import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/loadable_image.dart';

class _SightCard extends StatelessWidget {
  final Sight sight;

  const _SightCard({
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
        aspectRatio: 1.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: Stack(
            children: [
              Container(
                color: UIKit.colors.cardBackground,
              ),
              Column(
                children: [
                  Expanded(
                    child: _TopPart(sight: sight),
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
    );
  }
}

class _TopPart extends StatelessWidget {
  final Sight sight;
  const _TopPart({
    super.key,
    required this.sight,
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
            style: UIKit.fonts.sightType14,
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
      // заменить на row: widget + sizedbox
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
                style: UIKit.fonts.sightName16,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 2),
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

class ListCard extends StatelessWidget {
  final Sight sight;
  const ListCard({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _SightCard(sight: sight),
        Positioned(
          right: 16,
          top: 16,
          child: UIKit.assets.svg.heart(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class WishlistCard extends StatelessWidget {
  final Sight sight;
  const WishlistCard({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _SightCard(sight: sight),
        Positioned(
          right: 16,
          top: 16,
          child: Row(
            children: [
              UIKit.assets.svg.calendar(
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              UIKit.assets.svg.close(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VisitedCard extends StatelessWidget {
  final Sight sight;
  const VisitedCard({
    super.key,
    required this.sight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _SightCard(sight: sight),
        Positioned(
          right: 16,
          top: 16,
          child: Row(
            children: [
              UIKit.assets.svg.share(
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              UIKit.assets.svg.close(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
