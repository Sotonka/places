import 'package:flutter/material.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/utils/utils.dart';

class SearchProvider extends ChangeNotifier {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  List<String> get history => _history;
  FocusNode get searchFocus => _searchFocus;
  TextEditingController get searchController => _searchController;
  bool get searching => _searchFocus.hasFocus;
  bool get searchInitState =>
      _searchFocus.hasFocus && _searchController.text.isEmpty;
  List<Sight>? get searchResult => _searchResult;
  String get submittedSearch => _submittedSearch;

  List<Sight> get sightList {
    if (_filteredPlaces != null && _filterIsActive) {
      return _filteredPlaces!;
    }

    return _sightList;
  }

  bool get filterIsActive => _filterIsActive;
  Filter? get filter => _filter;
  Map<String, dynamic>? get popResult => _popResult;

  List<Sight>? get filteredPlaces {
    if (_filter == null) return null;
    _filteredPlaces = [];
    for (final sight in mocks) {
      if (_filter!.categories.contains(sight.type) &&
          Utils().arePointsNear(
            checkPoint: sight.coord,
            centerPoint: Coord(lat: 48.483385, lon: 135.07593),
            kmEnd: _filter!.distance.end / 1000,
            kmStart: _filter!.distance.start / 1000,
          )) {
        _filteredPlaces!.add(sight);
      }
    }

    return _filteredPlaces;
  }

  set filteredPlaces(List<Sight>? value) {
    _filteredPlaces = value;
    notifyListeners();
  }

  set submittedSearch(String value) {
    _submittedSearch = value;
    notifyListeners();
  }

  set filter(Filter? value) {
    if (value != null) {
      _filter = value;
      _filterIsActive = true;
    }
  }

  set filterIsActive(bool value) {
    _filterIsActive = value;
    notifyListeners();
  }

  set popResult(Map<String, dynamic>? value) {
    _popResult = value;
    notifyListeners();
  }

  bool _filterIsActive = false;
  Filter? _filter;
  late Map<String, dynamic>? _popResult;
  List<Sight>? _filteredPlaces;
  List<Sight>? _searchResult;
  List<String> _history = [];
  List<Sight> _sightList = mocks;
  String _submittedSearch = '';

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void addHistory(String element) {
    if (_history.contains(element)) {
    } else {
      _history.add(element);
      notifyListeners();
    }
  }

  void removeAtHistory(int index) {
    _history.removeAt(index);
    notifyListeners();
  }

  void clearHistory() {
    _history = [];
    notifyListeners();
  }

  void clearSearch() {
    searchController.text = '';
    notifyListeners();
  }

  void setSearchController(String value) {
    _searchController
      ..text = value
      ..selection =
          TextSelection.collapsed(offset: _searchController.text.length);
    notifyListeners();
  }

  void getPopResult() {
    if (popResult != null) {
      _filteredPlaces = _popResult!['filteredPlaces'] as List<Sight>;
      _filterIsActive = _popResult!['isFilterActive'] as bool;
      _filter = _popResult!['filter'] as Filter;
    }

    notifyListeners();
  }

  void unfocus() {
    _searchFocus.unfocus();
    _searchController.text = '';
    notifyListeners();
  }

  void findSights(String value) {
    _searchResult = [];

    _sightList = mocks;

    for (final element in sightList) {
      if (value.length > element.name.length) {
      } else if (element.name.substring(0, value.length).toLowerCase() ==
          searchController.text.toLowerCase()) {
        if (_searchResult!.contains(element)) {
        } else {
          _searchResult!.add(element);
        }
      } else {
        // ДЕЛАТЬ ЕГО NULL И ПРОВЕРЯТЬ ЕСЛИ NULL ТО ЭКРАН ОШИБКИ
        //_searchResult = [];
      }
    }

    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  void updateList() {
    _sightList = filteredPlaces ?? mocks;
  }
}
