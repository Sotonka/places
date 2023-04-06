import 'package:flutter/material.dart';

class Utils {
  Utils();

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
    String nextField,
  ) {
    currentFocus.unfocus();
    if (nextField.isEmpty) {
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

int generateId(String letters) {
  var result = 0;
  for (var i = 0; i < letters.length; i++) {
    result = result * 26 + (letters.codeUnitAt(i) & 0x1f);
  }

  return result;
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
