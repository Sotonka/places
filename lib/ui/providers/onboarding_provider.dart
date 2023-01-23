import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  final _controller = PageController();

  PageController get controller => _controller;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }

  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void jump() {
    if (page <= 1) {
      _page++;
      _controller.jumpToPage(_page);
      notifyListeners();
    }
  }

  void start() {
    _page = 0;
    _controller.jumpToPage(_page);
    notifyListeners();
  }

  void init() {
    _page = 0;
  }
}
