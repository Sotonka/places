import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: themeColors.sightDetails,
              height: 360,
              child: LoadableImage(
                url: sight.url,
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
                  const SizedBox(height: 24),
                  Text(
                    sight.details,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  const SizedBox(height: 24),
                  ColoredButton(
                    text: AppStrings.sightDetailsScreenRoute,
                    onPressed: () {},
                    icon: AppIcons.route() as SvgPicture,
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
                          text: AppStrings.sightDetailsScreenSchedule,
                          onPressed: () {},
                          isActive: false,
                          icon: AppIcons.calendar(
                            color: AppColors.primaryLightInactive,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TransparentButton(
                          text: AppStrings.sightDetailsScreenFavorite,
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
    );
  }
}
