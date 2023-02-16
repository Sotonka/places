import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class SightListProvider extends ChangeNotifier {
  /// [_sightList] - список мест для отображения
  /// [sightList] - в зависимости, активен ли фильтр, возвращает список мест
  /// [_sightList], либо список отфильтрованных мест [_filteredPlaces]

  final List<Sight> _sightList = mocks;
  final List<Place> _placeList = [];

  List<Sight> get sightList {
    if (_filteredPlaces != null) {
      return _filteredPlaces!;
    }

    return _sightList;
  }

  List<Place> get placeList {
    return _placeList;
  }

  // ignore: unnecessary_getters_setters
  bool get isloading {
    return _isloading;
  }

  set isloading(bool value) {
    _isloading = value;
  }

  List<Sight>? _filteredPlaces;

  bool _isloading = false;

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

  void clearFilteredPlaces() {
    _filteredPlaces = null;
    notifyListeners();
  }

  Future<void> loadPlaces() async {
    final loadedData = await PlaceInteractor().getPlaces();

    for (final place in loadedData) {
      if (place.id.toString().contains('8886')) {
        _placeList.add(place);
      }
    }

    _isloading = false;
    notifyListeners();
  }
}
