import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class ColoredButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool isActive;

  const ColoredButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isActive ? themeColors.greenAccent : themeColors.sightCard,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextStyle.bold14.copyWith(
                color: isActive
                    ? AppColors.primaryLightFFF
                    : AppColors.primaryLightInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
