import 'package:flutter/material.dart';

class SightDetailsProvider extends ChangeNotifier {
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

  void init() {
    _page = 0;
  }
}
