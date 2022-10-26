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

  SvgPicture heartFull({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('heart_full'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );
  SvgPicture list({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('list'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture listFull({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('list_full'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture settings({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('settings'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture settingsFull({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('settings_full'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture map({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('map'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture mapFull({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('map_full'),
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

  SvgPicture close({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('close'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture share({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('share'),
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
