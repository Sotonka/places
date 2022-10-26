import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class TextThemeCollection {
  static const String _defaultFontFamily = 'Roboto';

  static const _textNormal = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: _defaultFontFamily,
  );
  static const _textW500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: _defaultFontFamily,
  );
  static const _textBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
  );

  TextStyle get bold32 => _textBold.copyWith(
        fontSize: 32,
        height: 36 / 32,
      );

  TextStyle get bold24 => _textBold.copyWith(
        fontSize: 24,
        height: 1.2,
      );

  TextStyle get bold18 => _textBold.copyWith(
        fontSize: 18,
        height: 1.25,
      );

  TextStyle get middle16 => _textW500.copyWith(
        fontSize: 16,
        height: 20 / 16,
      );

  TextStyle get bold14 => _textBold.copyWith(
        fontSize: 14,
        height: 18 / 14,
      );

  TextStyle get normal14 => _textNormal.copyWith(
        fontSize: 14,
        height: 18 / 14,
      );
}
