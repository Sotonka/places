import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/ui/widget/loadable_image.dart';
import 'package:places/utils/utils.dart';
import 'package:text_chunk_styling/text_chunk_styling.dart';

class SightCardTab extends StatelessWidget {
  final Place sight;
  final List<String> search;

  const SightCardTab({
    super.key,
    required this.sight,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                child: LoadableImage(
                  url: sight.urls![0],
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
                SizedBox(
                  width: width - 104,
                  child: TextChunkStyling(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    caseSensitive: false,
                    text: sight.name,
                    highlightText: search,
                    highlightTextStyle:
                        theme.primaryTextTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textStyle: theme.primaryTextTheme.headline6,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: width - 104,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    sight.name.capitalize(),
                    style: theme.primaryTextTheme.bodyText1!.copyWith(
                      color: AppColors.primaryLightE92,
                    ),
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
      ),
    );
  }
}
