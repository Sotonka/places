import 'package:flutter/material.dart';
import 'package:places/data/interactor/settings_interactor.dart';

class ThemeProvider extends ChangeNotifier {
  bool get themeIsLight => _themeIsLight;

  bool _themeIsLight = true;

  Future<void> getTheme() async {
    _themeIsLight = await SettingsInteractor().themeSettings();
    notifyListeners();
  }

  void changeTheme() {
    _themeIsLight = !_themeIsLight;
    notifyListeners();
  }
}
