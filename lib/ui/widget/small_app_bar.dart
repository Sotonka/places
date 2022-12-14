import 'package:flutter/material.dart';

class SmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? bottom;
  final Widget? titleWidget;

  @override
  Size get preferredSize => const Size.fromHeight(400);

  const SmallAppBar({
    super.key,
    this.title,
    this.bottom,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16).add(
        EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          titleWidget ??
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: theme.primaryTextTheme.headline3,
              ),
          if (bottom != null) ...[const SizedBox(height: 22), bottom!],
        ],
      ),
    );
  }
}
