import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

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
              child: Image.network(
                'https://regions.kidsreview.ru/sites/default/files/styles/card_600_400/public/10/02/2015_-_1132/kofe_repablik_habarovsk.png',
                fit: BoxFit.cover,
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
                  // кнопка не совсем такая, переделаю как будут отдельные виджеты
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        UIKit.colors.greenF50,
                      ),
                    ),
                    onPressed: () {},
                    icon: UIKit.assets.svg.route(
                      color: Colors.white,
                    ),
                    label: Text(
                      UIKit.strings.sightDetailsScreenRoute,
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
                        child: CustomButton(
                          icon: UIKit.assets.svg.calendar(),
                          isActive: false,
                          title: UIKit.strings.sightDetailsScreenSchedule,
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          icon: UIKit.assets.svg.heart(),
                          isActive: true,
                          title: UIKit.strings.sightDetailsScreenFavorite,
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

class CustomButton extends StatelessWidget {
  final SvgPicture icon;
  final bool isActive;
  final String title;
  const CustomButton({
    super.key,
    required this.icon,
    required this.isActive,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // у иконки нельзя выбрать цвет, поменяю когда отдельно будут виджеты
            icon,
            const SizedBox(width: 10),
            Text(
              title,
              style: UIKit.fonts.normal14.copyWith(
                color: isActive
                    ? UIKit.colors.mainFontColor
                    : UIKit.colors.inactiveFontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
