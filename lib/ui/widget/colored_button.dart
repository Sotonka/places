import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return InkWell(
      onTap: isActive ? onPressed : () {},
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
