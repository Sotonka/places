import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/loadable_image.dart';
import 'package:places/utils/utils.dart';

class SightCardTab extends StatelessWidget {
  final Sight sight;
  final String? search;
  const SightCardTab({
    super.key,
    required this.sight,
    this.search,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              child: LoadableImage(
                url: sight.url,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryLightInactive,
              ),
              height: 56,
              width: 56,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              _BuildTitle(
                string: sight.name,
                lenght: search != null ? search!.length : 0,
                style: theme.primaryTextTheme.headline6!,
              ),
              const SizedBox(height: 8),
              Text(
                sight.typeAsText.capitalize(),
                style: theme.primaryTextTheme.bodyText1!.copyWith(
                  color: AppColors.primaryLightE92,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 0.8,
                width: MediaQuery.of(context).size.width - 104,
                color: AppColors.primaryLightInactive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildTitle extends StatelessWidget {
  final String string;
  final int lenght;
  final TextStyle style;

  const _BuildTitle({
    super.key,
    required this.string,
    required this.lenght,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: string.substring(0, lenght),
        style: style.copyWith(
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: string.substring(lenght, string.length),
            style: style,
          ),
        ],
      ),
    );
  }
}
