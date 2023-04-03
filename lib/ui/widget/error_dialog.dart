import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/icons.dart';
import 'package:places/ui/ui_kit/strings.dart';
import 'package:places/ui/ui_kit/text_styles.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height / 2,
        maxWidth: size.width - 32,
        minHeight: 100,
      ),
      child: SizedBox(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: AlertDialog(
            content: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.error(
                    color: AppColors.primaryLightInactive,
                    height: 64,
                    width: 64,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppStrings.errorDialogError,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.middle18.copyWith(
                      color: AppColors.primaryLightInactive,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.errorDialogMsg1,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal14.copyWith(
                      color: AppColors.primaryLightInactive,
                    ),
                  ),
                  Text(
                    AppStrings.errorDialogMsg2,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.normal14.copyWith(
                      color: AppColors.primaryLightInactive,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
