import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onSuffixPressed;
  final bool filters;
  final bool suffixClose;
  final bool readOnly;
  final TextEditingController? controller;
  final FocusNode? focus;
  final VoidCallback? onComplete;
  final void Function(String)? onChange;

  const SearchBar({
    super.key,
    required this.onPressed,
    required this.onSuffixPressed,
    this.filters = false,
    this.suffixClose = false,
    this.readOnly = true,
    this.controller,
    this.focus,
    this.onComplete,
    this.onChange,
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
        onChanged: onChange,
        controller: controller,
        readOnly: readOnly,
        focusNode: focus,
        onTap: onPressed,
        onEditingComplete: onComplete,
        decoration: InputDecoration(
          hintText: 'Поиск',
          prefixIcon: UnconstrainedBox(
            child: AppIcons.search(
              color: AppColors.primaryLightInactive,
            ),
          ),
          suffixIcon: UnconstrainedBox(
            child: InkWell(
              onTap: onSuffixPressed,
              child: suffixClose
                  ? Icon(
                      Icons.cancel,
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
