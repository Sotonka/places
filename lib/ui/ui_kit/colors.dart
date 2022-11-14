import 'package:flutter/material.dart';

class AppColors {
  Color get primaryBlueE5B => const Color(0xFF3B3E5B);

  Color get primaryLightE92 => const Color(0xFF7C7E92);
  Color get primaryLightInactive => const Color(0x8F7C7E92);
  Color get primaryLight5F5 => const Color(0xFFF5F5F5);
  Color get primaryLightFFF => const Color(0xFFFFFFFF);

  Color get primaryDarkA20 => const Color(0xFF191A20);
  Color get primaryDark22C => const Color(0xFF21222C);
  Color get primaryDark849 => const Color(0xFF252849);

  Color get greenF50 => const Color(0xFF4CAF50);
  Color get splash4C4 => const Color(0xFFC4C4C4).withOpacity(0.5);
}

@immutable
class ThemeColors extends ThemeExtension<ThemeColors> {
  static const light = ThemeColors(
    icons: Color(0xFF3B3E5B),
    bottomNavBar: Color(0xFFFFFFFF),
    sightCard: Color(0xFFF5F5F5),
    tabSwitch: Color(0xFF3B3E5B),
    tabSwitchText: Color(0xFFFFFFFF),
    sightDetails: Color(0xFFFFFFFF),
  );

  static const dark = ThemeColors(
    icons: Color(0xFFFFFFFF),
    bottomNavBar: Color(0xFF21222C),
    sightCard: Color(0xFF191A20),
    tabSwitch: Color(0xFFFFFFFF),
    tabSwitchText: Color(0xFF3B3E5B),
    sightDetails: Color(0xFF191A20),
  );

  final Color? icons;
  final Color? bottomNavBar;
  final Color? sightCard;
  final Color? tabSwitch;
  final Color? tabSwitchText;
  final Color? sightDetails;

  const ThemeColors({
    required this.icons,
    required this.bottomNavBar,
    required this.sightCard,
    required this.tabSwitch,
    required this.tabSwitchText,
    required this.sightDetails,
  });

  @override
  ThemeColors copyWith({
    Color? icons,
    Color? bottomNavBar,
    Color? sightCard,
    Color? tabSwitch,
    Color? tabSwitchText,
    Color? sightDetails,
  }) {
    return ThemeColors(
      icons: icons ?? this.icons,
      bottomNavBar: bottomNavBar ?? this.bottomNavBar,
      sightCard: sightCard ?? this.sightCard,
      tabSwitch: tabSwitch ?? this.tabSwitch,
      tabSwitchText: tabSwitchText ?? this.tabSwitchText,
      sightDetails: sightDetails ?? this.sightDetails,
    );
  }

  // Controls how the properties change on theme changes
  @override
  ThemeColors lerp(ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      icons: Color.lerp(icons, other.icons, t),
      bottomNavBar: Color.lerp(bottomNavBar, other.bottomNavBar, t),
      sightCard: Color.lerp(sightCard, other.sightCard, t),
      tabSwitch: Color.lerp(tabSwitch, other.tabSwitch, t),
      tabSwitchText: Color.lerp(tabSwitchText, other.tabSwitchText, t),
      sightDetails: Color.lerp(sightDetails, other.sightDetails, t),
    );
  }
}
