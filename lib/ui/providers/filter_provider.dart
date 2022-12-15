import 'package:flutter/material.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/utils/utils.dart';

class FilterProvider extends ChangeNotifier {
  /// [_filteredPlaces] - результирующий массив списка мест, отсортированных
  /// с учетом фильтра [_filter]
  /// [isEmptySearch] - проверка _filteredPlaces.isEmpty - для отображения
  /// активности кнопки
  /// [updateRange] - вызывается при изменении слайдера, изменяет значения
  /// distance в фильтре
  /// [filterContains] - содержит ли фильтр категорию
  /// [updateFilteredPlaces] - изменяет _filteredPlaces с учетом фильтра
  Filter get filter => _filter;

  int get filteredPlacesLenght => _filteredPlaces.length;
  int get distanceStart => (_filter.distance.start / 1000).round();
  int get distanceEnd => (_filter.distance.end / 1000).round();

  bool get isEmptySearch => _filteredPlaces.isEmpty;

  List<Sight> get filteredPlaces {
    return _filteredPlaces;
  }

  set filter(Filter? value) {
    if (value != null) {
      _filter = value;
    }
  }

  Filter _filter = Filter();
  List<Sight> _filteredPlaces = [];

  void updateRange(double start, double end) {
    _filter = _filter.copyWith(
      distance: Range(start, end),
    );
    updateFilteredPlaces();
    notifyListeners();
  }

  void clearFilter() {
    _filter = Filter();
    _filteredPlaces = [];
    notifyListeners();
  }

  bool filterContains(SightType element) {
    return _filter.categories.contains(element);
  }

  void filterToggle(SightType element) {
    _filter = _filter.toggleCategory(element);
    updateFilteredPlaces();
    notifyListeners();
  }

  bool isFilterActive() {
    return !_filter.isEmpty();
  }

  void updateFilteredPlaces() {
    _filteredPlaces = [];
    for (final sight in mocks) {
      if (_filter.categories.contains(sight.type) &&
          Utils().arePointsNear(
            checkPoint: sight.coord,
            centerPoint: Coord(
              lat: AppConstants.centerPointLat,
              lon: AppConstants.centerPointLon,
            ),
            kmEnd: _filter.distance.end / 1000,
            kmStart: _filter.distance.start / 1000,
          )) {
        _filteredPlaces.add(sight);
      }
    }
  }
}
