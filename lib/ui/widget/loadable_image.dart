import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class LoadableImage extends StatelessWidget {
  final String url;

  const LoadableImage({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: CircularProgressIndicator(
            color: UIKit.colors.primaryBlueE5B,
            backgroundColor: UIKit.colors.primaryLight5F5,
          ),
        );
      },
    );
  }
}
