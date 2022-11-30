import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onFilterPressed;
  final bool filters;
  final bool suffixClose;

  const SearchBar({
    super.key,
    required this.onPressed,
    required this.onFilterPressed,
    this.filters = false,
    this.suffixClose = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Ink(
      decoration: BoxDecoration(
        color: themeColors.sightCard,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        readOnly: true,
        onTap: onPressed,
        decoration: InputDecoration(
          hintText: 'Поиск',
          prefixIcon: UnconstrainedBox(
            child: AppIcons.search(
              color: AppColors.primaryLightInactive,
            ),
          ),
          suffixIcon: UnconstrainedBox(
            child: InkWell(
              onTap: onFilterPressed,
              child: suffixClose
                  ? AppIcons.close(
                      color: themeColors.icons,
                    )
                  : AppIcons.filter(
                      color: filters
                          ? themeColors.greenAccent
                          : AppColors.primaryLightInactive,
                    ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
        ),
      ),
    );
  }
}
