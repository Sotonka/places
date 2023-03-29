import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/icons.dart';
import 'package:places/ui/ui_kit/text_styles.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 40,
      ),
      child: Column(
        children: [
          AppIcons.search(
            color: AppColors.primaryLightInactive,
            height: 48,
            width: 51,
          ),
          const SizedBox(height: 32),
          Text(
            'Ничего не найдено.',
            textAlign: TextAlign.center,
            style: AppTextStyle.middle18.copyWith(
              color: AppColors.primaryLightInactive,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Попробуйте изменить параметры поиска',
            textAlign: TextAlign.center,
            style: AppTextStyle.normal14.copyWith(
              color: AppColors.primaryLightInactive,
            ),
          ),
        ],
      ),
    );
  }
}
