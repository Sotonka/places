import 'package:flutter/material.dart';

import 'package:places/ui/ui_kit/ui_kit.dart';

class FilterTile extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
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
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

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
                  color: themeColors.greenAccent!.withOpacity(0.16),
                  child: icon,
                ),
              ),
            ),
            if (isActive)
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.check_circle_rounded,
                  color: themeColors.icons,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          placeType,
          style: AppTextStyle.normal12,
        ),
      ],
    );
  }
}
