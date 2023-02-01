import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class ColoredButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool isActive;
  final bool isInverted;

  const ColoredButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isActive = true,
    this.isInverted = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return GestureDetector(
      onTap: isActive ? onPressed : () {},
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isActive
              ? isInverted
                  ? themeColors.bottomNavBar
                  : themeColors.greenAccent
              : themeColors.sightCard,
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
                    ? isInverted
                        ? themeColors.greenAccent
                        : AppColors.primaryLightFFF
                    : AppColors.primaryLightInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
