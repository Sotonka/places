import 'package:flutter/material.dart';

class AppTextStyle {
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

  static TextStyle bold32 = _textBold.copyWith(
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    fontSize: 32,
    height: 36 / 32,
  );

  static TextStyle bold24 = _textBold.copyWith(
    fontSize: 24,
    height: 1.2,
  );

  static TextStyle middle18 = _textW500.copyWith(
    fontSize: 18,
    height: 1.25,
  );

  static TextStyle middle16 = _textW500.copyWith(
    fontSize: 16,
    height: 20 / 16,
  );

  static TextStyle bold14 = _textBold.copyWith(
    fontSize: 14,
    height: 18 / 14,
  );

  static TextStyle normal14 = _textNormal.copyWith(
    fontSize: 14,
    height: 18 / 14,
  );

  static TextStyle normal12 = _textNormal.copyWith(
    fontSize: 12,
    height: 16 / 12,
  );

  const AppTextStyle._();
}
