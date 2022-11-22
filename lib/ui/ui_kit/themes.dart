import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class ThemeCollection {
  static final TextTheme _lightTextTheme = TextTheme(
    headline1: UIKit.fonts.bold32.copyWith(
      color: UIKit.colors.primaryBlueE5B,
    ),
    headline2: UIKit.fonts.bold24.copyWith(
      color: UIKit.colors.primaryBlueE5B,
    ),
    headline3: UIKit.fonts.middle18.copyWith(
      color: UIKit.colors.primaryBlueE5B,
    ),
    headline6: UIKit.fonts.middle16.copyWith(
      color: UIKit.colors.primaryBlueE5B,
    ),
    bodyText1: UIKit.fonts.normal14.copyWith(
      color: UIKit.colors.primaryBlueE5B,
    ),
    bodyText2: UIKit.fonts.normal12.copyWith(
      color: UIKit.colors.primaryLightInactive,
    ),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: UIKit.fonts.bold32.copyWith(
      color: UIKit.colors.primaryLightFFF,
    ),
    headline2: UIKit.fonts.bold24.copyWith(
      color: UIKit.colors.primaryLightFFF,
    ),
    headline3: UIKit.fonts.middle18.copyWith(
      color: UIKit.colors.primaryLightFFF,
    ),
    headline6: UIKit.fonts.middle16.copyWith(
      color: UIKit.colors.primaryLightFFF,
    ),
    bodyText1: UIKit.fonts.normal14.copyWith(
      color: UIKit.colors.primaryLightE92,
    ),
    bodyText2: UIKit.fonts.normal12.copyWith(
      color: UIKit.colors.primaryLightInactive,
    ),
  );

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        backgroundColor: UIKit.colors.primaryLightFFF,
        scaffoldBackgroundColor: UIKit.colors.primaryLightFFF,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        useMaterial3: true,
        primaryTextTheme: _lightTextTheme,
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        backgroundColor: UIKit.colors.primaryDark22C,
        scaffoldBackgroundColor: UIKit.colors.primaryDark22C,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        useMaterial3: true,
        primaryTextTheme: _darkTextTheme,
      );

  SliderThemeData get sliderTheme => SliderThemeData(
        disabledThumbColor: Colors.white,
        trackHeight: 2,
        thumbColor: Colors.white,
        inactiveTrackColor: UIKit.colors.primaryLightInactive,
        activeTrackColor: UIKit.colors.greenF50,
        rangeTrackShape: const RectangularRangeSliderTrackShape(),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          enabledThumbRadius: 8,
          elevation: 2,
        ),
      );

  ThemeCollection();
}
