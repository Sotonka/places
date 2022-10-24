import 'package:places/ui/ui_kit/assets.dart';
import 'package:places/ui/ui_kit/colors.dart';
import 'package:places/ui/ui_kit/constants.dart';
import 'package:places/ui/ui_kit/decoration.dart';
import 'package:places/ui/ui_kit/fonts.dart';
import 'package:places/ui/ui_kit/mutable.dart';
import 'package:places/ui/ui_kit/strings.dart';

abstract class UIKit {
  static AppColors colors = AppColors();
  static Assets assets = Assets();
  static Constants constants = Constants();
  static DecorationCollection decoration = DecorationCollection();
  static TextThemeCollection fonts = TextThemeCollection();
  static MutableCollection mutable = MutableCollection();
  static Strings strings = Strings();
}
