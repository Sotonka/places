import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class LoadableImage extends StatelessWidget {
  final dynamic url;

  const LoadableImage({
    super.key,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    if (url.runtimeType == String) {
      return Image.network(
        url as String,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBlueE5B,
              backgroundColor: AppColors.primaryLight5F5,
            ),
          );
        },
      );
    } else if (url.runtimeType == List<String>) {
      final typedUrl = url as List<String>;

      return typedUrl.isEmpty
          ? AppImages.noImg(
              fit: BoxFit.cover,
            )
          : Image.network(
              typedUrl[0],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryBlueE5B,
                    backgroundColor: AppColors.primaryLight5F5,
                  ),
                );
              },
            );
    } else {
      return AppImages.noImg(
        fit: BoxFit.cover,
      );
    }
  }
}
