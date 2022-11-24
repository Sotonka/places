import 'package:flutter/material.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/text_styles.dart';

class AppTheme {
  static final TextTheme _lightTextTheme = TextTheme(
    headline1: AppTextStyle.bold32.copyWith(
      color: AppColors.primaryBlueE5B,
    ),
    headline2: AppTextStyle.bold24.copyWith(
      color: AppColors.primaryBlueE5B,
    ),
    headline3: AppTextStyle.middle18.copyWith(
      color: AppColors.primaryBlueE5B,
    ),
    headline6: AppTextStyle.middle16.copyWith(
      color: AppColors.primaryBlueE5B,
    ),
    bodyText1: AppTextStyle.normal14.copyWith(
      color: AppColors.primaryBlueE5B,
    ),
    bodyText2: AppTextStyle.normal12.copyWith(
      color: AppColors.primaryLightInactive,
    ),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: AppTextStyle.bold32.copyWith(
      color: AppColors.primaryLightFFF,
    ),
    headline2: AppTextStyle.bold24.copyWith(
      color: AppColors.primaryLightFFF,
    ),
    headline3: AppTextStyle.middle18.copyWith(
      color: AppColors.primaryLightFFF,
    ),
    headline6: AppTextStyle.middle16.copyWith(
      color: AppColors.primaryLightFFF,
    ),
    bodyText1: AppTextStyle.normal14.copyWith(
      color: AppColors.primaryLightE92,
    ),
    bodyText2: AppTextStyle.normal12.copyWith(
      color: AppColors.primaryLightInactive,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    backgroundColor: AppColors.primaryLightFFF,
    scaffoldBackgroundColor: AppColors.primaryLightFFF,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    useMaterial3: true,
    primaryTextTheme: _lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',
    backgroundColor: AppColors.primaryDark22C,
    scaffoldBackgroundColor: AppColors.primaryDark22C,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    useMaterial3: true,
    primaryTextTheme: _darkTextTheme,
  );

  // ignore: member-ordering-extended
  static const SliderThemeData sliderTheme = SliderThemeData(
    disabledThumbColor: Colors.white,
    trackHeight: 2,
    thumbColor: Colors.white,
    inactiveTrackColor: AppColors.primaryLightInactive,
    activeTrackColor: AppColors.greenF50,
    rangeTrackShape: RectangularRangeSliderTrackShape(),
    rangeThumbShape: RoundRangeSliderThumbShape(
      enabledThumbRadius: 8,
      elevation: 2,
    ),
  );

  AppTheme();
}
