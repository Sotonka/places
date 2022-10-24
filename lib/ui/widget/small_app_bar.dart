import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class SmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? bottom;

  @override
  Size get preferredSize => const Size.fromHeight(400);

  const SmallAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(
            title,
            textAlign: TextAlign.center,
            style: UIKit.fonts.bold18,
          ),
          if (bottom != null) ...{const SizedBox(height: 22), bottom!},
        ],
      ),
    );
  }
}
