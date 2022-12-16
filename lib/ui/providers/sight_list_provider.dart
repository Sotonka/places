import 'package:flutter/material.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class SightListProvider extends ChangeNotifier {
  /// [_sightList] - список мест для отображения
  /// [sightList] - в зависимости, активен ли фильтр, возвращает список мест
  /// [_sightList], либо список отфильтрованных мест [_filteredPlaces]
  /// [_popResult] map с параметрами, приходящими с Navigator.pop страницы
  /// фильтров, содержит {'filteredPlaces' : список отфильтрованных мест,
  /// 'isFilterActive': активен ли фильтр, 'filter': фильтр}
  final List<Sight> _sightList = mocks;

  List<Sight> get sightList {
    if (_filteredPlaces != null && _filterIsActive) {
      return _filteredPlaces!;
    }

    return _sightList;
  }

  bool get filterIsActive => _filterIsActive;
  Filter? get filter => _filter;
  Map<String, dynamic>? get popResult => _popResult;

  set filterIsActive(bool value) {
    _filterIsActive = value;
    notifyListeners();
  }

  set popResult(Map<String, dynamic>? value) {
    _popResult = value;
    notifyListeners();
  }

  List<Sight>? _filteredPlaces;
  bool _filterIsActive = false;
  late Map<String, dynamic>? _popResult;
  Filter? _filter;

  void getPopResult() {
    if (popResult != null) {
      _filteredPlaces = _popResult!['filteredPlaces'] as List<Sight>;
      _filterIsActive = _popResult!['isFilterActive'] as bool;
      _filter = _popResult!['filter'] as Filter;
    }

    notifyListeners();
  }

  void appendSigtList(Sight? newSight) {
    if (newSight != null) {
      notifyListeners();
    }
  }
}
