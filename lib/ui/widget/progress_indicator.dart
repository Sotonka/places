import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = theme.extension<AppThemeColors>()!;

    return Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          color: themeColors.greenAccent,
        ),
      ),
    );
  }
}
