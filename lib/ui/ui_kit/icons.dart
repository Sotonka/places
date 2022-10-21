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
