import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Svg {
  final String _defaultPath = 'res/icons/';
  final _defaultColor = Colors.white;

  SvgPicture calendar({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('calendar'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture heart({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('heart'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture route({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('route'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  String _name(String name) {
    return name.endsWith('.svg')
        ? _defaultPath + name
        : '$_defaultPath$name.svg';
  }
}

// class AppIcons extends StatelessWidget {
//   static const _arrowBack = 'assets/icons/arrow_back.svg';
//   final String assetPath;
//   final double? width;
//   final double? height;
//   final BoxFit? fit;
//   final Color? color;

//   final String _defaultPath = 'res/icons/';
//   final _defaultColor = Colors.black54;

//   const AppIcons({
//     required this.assetPath,
//     this.width,
//     this.height,
//     this.fit,
//     this.color,
//     Key? key,
//   }) : super(key: key);

//   factory AppIcons.calendar({
//     final Color? color,
//     final double? height,
//     final double? width,
//   }) =>
//       AppIcons(
//         assetPath: _name('calendar'),
//         color: color,
//         height: height,
//         width: width,
//       );

//   @override
//   Widget build(BuildContext context) => SvgPicture.asset(
//         assetPath,
//         width: width,
//         height: height,
//         color: color,
//         key: key,
//       );
// }
