import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class TextThemeCollection {
  final String fontFamily = 'Roboto';
  final _defaultColor = UIKit.colors.mainFontColor;

  TextStyle get appBar32 => TextStyle(
        color: _defaultColor,
        fontFamily: 'Roboto',
        fontSize: 32,
        height: 1.125,
        fontWeight: FontWeight.w700,
      );

  TextStyle get sightType14 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: Colors.white,
        height: 18 / 14,
        fontWeight: FontWeight.bold,
      );

  TextStyle get sightName16 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        color: _defaultColor,
        height: 20 / 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get sightName24 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        color: _defaultColor,
        height: 28.8 / 24,
        fontWeight: FontWeight.bold,
      );

  TextStyle get normal14 => TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        color: UIKit.colors.secondaryFontColor,
        height: 18 / 14,
        fontWeight: FontWeight.normal,
      );
}
