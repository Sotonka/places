import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class ColoredButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final SvgPicture? icon;

  const ColoredButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: UIKit.colors.greenF50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 10),
            Text(
              text,
              style: UIKit.fonts.sightType14,
            ),
          ],
        ),
      ),
    );
  }
}
