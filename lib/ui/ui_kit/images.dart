import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages extends StatelessWidget {
  static const _add = '${_defaultPath}no-img.jpg';

  static const String _defaultPath = 'res/images/';

  final String assetPath;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AppImages({
    required this.assetPath,
    this.width,
    this.height,
    this.fit,
    Key? key,
  }) : super(key: key);

  factory AppImages.noImg({
    final double? height,
    final double? width,
    final BoxFit? fit,
  }) =>
      AppImages(
        assetPath: _add,
        height: height,
        width: width,
        fit: fit,
      );

  @override
  Widget build(BuildContext context) => Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: fit,
        key: key,
      );
}
