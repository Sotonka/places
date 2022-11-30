import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Widget? icon;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return InkWell(
      onTap: onPressed,
      child: Container(
        //constraints: BoxConstraints(minHeight: 10, maxWidth: 10),
        height: 48,

        decoration: BoxDecoration(
          color: themeColors.greenAccent,
          gradient: LinearGradient(
            colors: <Color>[
              themeColors.yellowAccent!,
              themeColors.greenAccent!,
            ],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 22,
            right: 22,
            top: 12,
            bottom: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              const SizedBox(width: 10),
              Text(
                text,
                style: AppTextStyle.bold14.copyWith(
                  color: AppColors.primaryLightFFF,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
