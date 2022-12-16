import 'package:flutter/material.dart';

class VisitingProvider extends ChangeNotifier {
  TabController get tabController => _tabController;

  set tabController(TabController value) {
    _tabController = value;
    notifyListeners();
  }

  late TabController _tabController;
}
