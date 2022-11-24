import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final void Function() onPressed;
  final Widget? icon;

  const TransparentButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isActive,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextStyle.normal14.copyWith(
                color: isActive
                    ? themeColors.icons
                    : AppColors.primaryLightInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
