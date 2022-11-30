import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(400);

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 30,
        left: 16,
        right: 16,
      ).add(
        EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.left,
        maxLines: 2,
        style: theme.primaryTextTheme.headline1,
      ),
    );
  }
}
