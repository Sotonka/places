import 'package:flutter/cupertino.dart';
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
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0x664CAF50),
      selectionHandleColor: Color(0xFF4CAF50),
      cursorColor: Color(0xFF4CAF50),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      hintStyle: const TextStyle(
        color: Color(0x8F7C7E92),
      ), // Размеры установятся как у базового
      errorStyle: const TextStyle(
        color: Color(0xFFCF2A2A),
      ),
      helperStyle: const TextStyle(
        color: Color(0xFF7C7E92),
      ),
      enabledBorder: _border(
        const Color(0x664CAF50),
      ),
      focusedBorder: _border(
        const Color(0x664CAF50),
        focused: true,
      ),
      errorBorder: _border(
        const Color(0x66CF2A2A),
      ),
      focusedErrorBorder: _border(
        const Color(0x66CF2A2A),
        focused: true,
      ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.light,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: AppTextStyle.middle16.copyWith(
          color: AppColors.primaryBlueE5B,
        ),
      ),
    ),
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
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color(0xFF21222C),
      selectionHandleColor: Color(0xFFFFFFFF),
      cursorColor: Color(0xFFFFFFFF),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      hintStyle: const TextStyle(
        color: Color(0x8F7C7E92),
      ), // Размеры установятся как у базового
      errorStyle: const TextStyle(
        color: Color(0xFFEF4343),
      ),
      helperStyle: const TextStyle(
        color: Color(0xFF7C7E92),
      ),
      enabledBorder: _border(
        const Color(0x666ADA6F),
      ),
      focusedBorder: _border(
        const Color(0x666ADA6F),
        focused: true,
      ),
      errorBorder: _border(
        const Color(0x29EF4343),
      ),
      focusedErrorBorder: _border(
        const Color(0x29EF4343),
        focused: true,
      ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.dark,
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle: AppTextStyle.middle16.copyWith(
          color: AppColors.primaryLightFFF,
        ),
      ),
    ),
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

InputBorder _border(Color? color, {bool focused = false}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: color == null
          ? const BorderSide(color: Colors.transparent, width: 0)
          : BorderSide(
              color: color,
              width: focused ? 2 : 1,
            ),
    );
