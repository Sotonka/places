import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/constants.dart';
import 'package:places/ui/ui_kit/decoration.dart';
import 'package:places/ui/ui_kit/icons.dart';
import 'package:places/ui/ui_kit/strings.dart';
import 'package:places/ui/ui_kit/text_styles.dart';
import 'package:places/ui/ui_kit/themes.dart';

abstract class UIKit {
  static Svg svg = Svg();
  static AppColors colors = AppColors();
  static Constants constants = Constants();
  static DecorationCollection decoration = DecorationCollection();
  static TextThemeCollection fonts = TextThemeCollection();
  static Strings strings = Strings();
  static ThemeCollection themes = ThemeCollection();
}
