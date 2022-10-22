import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/loadable_image.dart';
import 'package:places/ui/widget/transparent_button.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  const SightDetails({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              height: 360,
              child: const LoadableImage(
                url:
                    'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
              ),
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
                    sight.name,
                    style: UIKit.fonts.sightName24,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        sight.typeAsText,
                        style: UIKit.fonts.sightType14.copyWith(
                          color: UIKit.colors.mainFontColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'закрыто до 09:00',
                        style: UIKit.fonts.normal14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    sight.details,
                    style: UIKit.fonts.normal14.copyWith(
                      color: UIKit.colors.mainFontColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ColoredButton(
                    text: UIKit.strings.sightDetailsScreenRoute,
                    onPressed: () {},
                    icon: UIKit.assets.svg.route(),
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
                          text: UIKit.strings.sightDetailsScreenSchedule,
                          onPressed: () {},
                          isActive: false,
                          icon: UIKit.assets.svg.calendar(
                            color: UIKit.colors.inactiveFontColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TransparentButton(
                          text: UIKit.strings.sightDetailsScreenFavorite,
                          onPressed: () {},
                          isActive: true,
                          icon: UIKit.assets.svg.heart(
                            color: UIKit.colors.mainFontColor,
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
  }
}
