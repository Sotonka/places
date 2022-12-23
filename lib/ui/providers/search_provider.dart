import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class SearchProvider extends ChangeNotifier {
  /// [_history] - список найденных мест
  /// [searchInitState] - состояние начала ввода в поле поиска
  /// [_searchResult] - список мест, обновляющийся в процессе ввода в
  /// поле поиска места
  /// [_submittedSearch] - строка для поиска по названию места
  /// [sightList] - возвращает список мест с учетом фильтра и _submittedSearch

  /// [findSights] - вызывается при изменении поля ввода поиска, изменяет
  /// _searchResult в зависимости от вхождения вводимых данных в название места
  /// в _sightList
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
    _resultList = null;

    _sightList = _filteredPlaces != null ? _filteredPlaces! : mocks;

    if (_submittedSearch.isNotEmpty) {
      _resultList = [];
      for (final element in _sightList!) {
        if (element.name
            .toLowerCase()
            .contains(_submittedSearch.toLowerCase())) {
          _resultList!.add(element);
        }
      }
    }

    return _resultList ?? _sightList!;
  }

  set submittedSearch(String value) {
    _submittedSearch = value;
    notifyListeners();
  }

  List<Sight>? _filteredPlaces;
  List<Sight>? _searchResult;
  List<String> _history = [];
  late List<Sight>? _sightList;
  List<Sight>? _resultList;
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

  void unfocus() {
    _searchController.text = '';
    _searchFocus.unfocus();

    notifyListeners();
  }

  void findSights(String value) {
    _submittedSearch = '';
    _searchResult = [];

    _sightList = sightList;

    for (final element in sightList) {
      if (element.name.toLowerCase().contains(value.toLowerCase())) {
        _searchResult!.add(element);
      }
    }

    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  void appendSigtList(Sight? newSight) {
    if (newSight != null) {
      notifyListeners();
    }
  }

  void refreshSightList({
    required List<Sight>? filteredList,
    required bool isActive,
  }) {
    if (filteredList != null && isActive) {
      _filteredPlaces = filteredList;

      _sightList = _filteredPlaces ?? mocks;

      notifyListeners();
    }
  }
}
