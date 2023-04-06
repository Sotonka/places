import 'package:flutter/material.dart';
import 'package:places/data/model/filters.dart';

class FilterProvider extends ChangeNotifier {
  bool isEmpty = true;
  Filter get filter => _filter;

  int get distanceEnd => (_filter.radius / 1000).round();

  set filter(Filter value) {
    _filter = value;
  }

  Filter _filter = Filter();
  Filter _initFilter = Filter();

  void updateRange(double radius) {
    _filter = _filter.copyWith(
      radius: radius,
    );
    isEmpty = _filter.isEmpty();
    notifyListeners();
  }

  void clearFilter() {
    _filter = Filter();
    isEmpty = _filter.isEmpty();
    notifyListeners();
  }

  bool filterContains(String element) {
    return _filter.typeFilter.contains(element);
  }

  void filterToggle(String element) {
    _filter = _filter.toggleCategory(element);
    isEmpty = _filter.isEmpty();
    notifyListeners();
  }

  void init() {
    _initFilter = _filter;
  }

  void revertFilter() {
    _filter = _initFilter;
  }
}
