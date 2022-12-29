import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlueE5B = Color(0xFF3B3E5B);
  static const Color primaryLightE92 = Color(0xFF7C7E92);
  static const Color primaryLightInactive = Color(0x8F7C7E92);
  static const Color primaryLightFFF = Color(0xFFFFFFFF);

  // light theme only
  static const Color primaryLight5F5 = Color(0xFFF5F5F5);

  static const Color greenF50 = Color(0xFF4CAF50);
  static const Color yellowF3D = Color(0xFFFCDD3D);
  static const Color redA2A = Color(0xFFCF2A2A);

// dark theme only
  static const Color primaryDarkA20 = Color(0xFF191A20);
  static const Color primaryDark22C = Color(0xFF21222C);
  static const Color primaryDark849 = Color(0xFF252849);

  static const Color greenA6F = Color(0xFF6ADA6F);
  static const Color yellow769 = Color(0xFFFFE769);
  static const Color red343 = Color(0xFFEF4343);

  static Color splash4C4 = const Color(0xFFC4C4C4).withOpacity(0.5);

  const AppColors._();
}

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  static const light = AppThemeColors(
    icons: Color(0xFF3B3E5B),
    bottomNavBar: Color(0xFFFFFFFF),
    sightCard: Color(0xFFF5F5F5),
    tabSwitch: Color(0xFF3B3E5B),
    tabSwitchText: Color(0xFFFFFFFF),
    sightDetails: Color(0xFFFFFFFF),
    greenAccent: Color(0xFF4CAF50),
    yellowAccent: Color(0xFFFCDD3D),
    error: Color(0xFFEF4343),
  );

  static const dark = AppThemeColors(
    icons: Color(0xFFFFFFFF),
    bottomNavBar: Color(0xFF21222C),
    sightCard: Color(0xFF191A20),
    tabSwitch: Color(0xFFFFFFFF),
    tabSwitchText: Color(0xFF3B3E5B),
    sightDetails: Color(0xFF191A20),
    greenAccent: Color(0xFF6ADA6F),
    yellowAccent: Color(0xFFFFE769),
    error: Color(0xFFCF2A2A),
  );

  final Color? icons;
  final Color? bottomNavBar;
  final Color? sightCard;
  final Color? tabSwitch;
  final Color? tabSwitchText;
  final Color? sightDetails;
  final Color? greenAccent;
  final Color? yellowAccent;
  final Color? error;

  const AppThemeColors({
    required this.icons,
    required this.bottomNavBar,
    required this.sightCard,
    required this.tabSwitch,
    required this.tabSwitchText,
    required this.sightDetails,
    required this.greenAccent,
    required this.yellowAccent,
    required this.error,
  });

  @override
  AppThemeColors copyWith({
    Color? icons,
    Color? bottomNavBar,
    Color? sightCard,
    Color? tabSwitch,
    Color? tabSwitchText,
    Color? sightDetails,
    Color? greenAccent,
    Color? yellowAccent,
    Color? error,
  }) {
    return AppThemeColors(
      icons: icons ?? this.icons,
      bottomNavBar: bottomNavBar ?? this.bottomNavBar,
      sightCard: sightCard ?? this.sightCard,
      tabSwitch: tabSwitch ?? this.tabSwitch,
      tabSwitchText: tabSwitchText ?? this.tabSwitchText,
      sightDetails: sightDetails ?? this.sightDetails,
      greenAccent: greenAccent ?? this.greenAccent,
      yellowAccent: yellowAccent ?? this.yellowAccent,
      error: error ?? this.error,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }

    return AppThemeColors(
      icons: Color.lerp(icons, other.icons, t),
      bottomNavBar: Color.lerp(bottomNavBar, other.bottomNavBar, t),
      sightCard: Color.lerp(sightCard, other.sightCard, t),
      tabSwitch: Color.lerp(tabSwitch, other.tabSwitch, t),
      tabSwitchText: Color.lerp(tabSwitchText, other.tabSwitchText, t),
      sightDetails: Color.lerp(sightDetails, other.sightDetails, t),
      greenAccent: Color.lerp(greenAccent, other.greenAccent, t),
      yellowAccent: Color.lerp(yellowAccent, other.yellowAccent, t),
      error: Color.lerp(error, other.error, t),
    );
  }
}
