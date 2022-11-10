import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Svg {
  final String _defaultPath = 'res/icons/';
  final _defaultColor = Colors.white;

  SvgPicture back({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('back'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

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

  SvgPicture cafe({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('cafe'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture choice({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('choice'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture forward({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('forward'),
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

  SvgPicture hotel({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('hotel'),
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

  SvgPicture museum({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('museum'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture park({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('park'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture particular({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('particular'),
        width: width,
        height: height,
        color: color ?? _defaultColor,
      );

  SvgPicture restaurant({
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        _name('restaurant'),
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
