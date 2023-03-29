import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';

class SightListProvider extends ChangeNotifier {
  final List<Place> _placeList = [];

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

  bool _isloading = false;

  void appendSigtList(Sight? newSight) {
    if (newSight != null) {
      notifyListeners();
    }
  }

  void renewPlaceList(List<Place> data) {
    _placeList.clear();
    for (final place in data) {
      if (place.id != 530) {
        _placeList.add(place);
      }
    }
    notifyListeners();
  }

  Future<void> loadPlaces() async {
    final loadedData = await PlaceInteractor().getPlaces();

    /* for (final place in loadedData) {
      if (place.id.toString().contains('8886')) {
        _placeList.add(place);
      }
    } */

    for (final place in loadedData) {
      //renew вместо add
      if ([
        '528',
        '531',
        '532',
        '533',
        '534',
        '535',
      ].any(place.id.toString().contains)) {
        _placeList.add(place);
      }
    }

    _isloading = false;
    notifyListeners();
  }

  Future<void> loadFilteredPlaces(Filter filter) async {
    final loadedData = await PlaceInteractor().getFilteresPlaces(filter);
    renewPlaceList(loadedData);
    await Future<void>.delayed(const Duration(seconds: 1));
    _isloading = false;
    notifyListeners();
  }
}
