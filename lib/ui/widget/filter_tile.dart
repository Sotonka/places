import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterTile extends StatelessWidget {
  final void Function() onPressed;
  final SvgPicture icon;
  final bool isActive;
  final String placeType;

  const FilterTile({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.placeType,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(32),
              ),
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 64,
                  width: 64,
                  color: UIKit.colors.greenF50.withOpacity(0.16),
                  child: icon,
                ),
              ),
            ),
            if (isActive)
              Positioned(
                bottom: 0,
                right: 0,
                child: UIKit.svg.choice(
                  color: UIKit.colors.primaryBlueE5B,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          placeType,
          style: UIKit.fonts.normal12,
        ),
      ],
    );
  }
}
