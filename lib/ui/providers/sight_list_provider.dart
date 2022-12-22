import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class SightListProvider extends ChangeNotifier {
  /// [_sightList] - список мест для отображения
  /// [sightList] - в зависимости, активен ли фильтр, возвращает список мест
  /// [_sightList], либо список отфильтрованных мест [_filteredPlaces]

  final List<Sight> _sightList = mocks;

  List<Sight> get sightList {
    if (_filteredPlaces != null) {
      return _filteredPlaces!;
    }

    return _sightList;
  }

  List<Sight>? _filteredPlaces;

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

      notifyListeners();
    }
  }
}
