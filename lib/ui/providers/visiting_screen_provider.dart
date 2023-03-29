import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';

class VisitingProvider extends ChangeNotifier {
  final List<Place> _favouritePlaces = <Place>[];
  final List<Place> _visitedPlaces = <Place>[];

  TabController get tabController => _tabController;

  List<Place> get favouritePlaces => _favouritePlaces;
  List<Place> get visitedPlaces => _visitedPlaces;

  set tabController(TabController value) {
    _tabController = value;
    notifyListeners();
  }

  late TabController _tabController;

  Future<void> addToFavourite(Place place) async {
    //_favouritePlaces = await PlaceInteractor().addToFavourite(place);

    _favouritePlaces.add(place);

    notifyListeners();
  }

  Future<void> removeFromFavourite(Place place) async {
    // _favouritePlaces = await PlaceInteractor().removeFromFavourite(place);

    _favouritePlaces.removeWhere((element) => element.id == place.id);

    notifyListeners();
  }

  Future<void> removeFromVisited(Place place) async {
    // _visitedPlaces = await PlaceInteractor().removeFromVisited(place);

    _visitedPlaces.removeWhere((element) => element.id == place.id);

    notifyListeners();
  }

  bool isInFavourite(Place place) {
    var isPresent = false;

    for (final element in _favouritePlaces) {
      if (place.id == element.id) {
        isPresent = true;
      }
    }

    return isPresent;
  }

  void reorderWishlist(int oldIndex, int newIndex) {
    var index = newIndex;
    if (oldIndex < newIndex) {
      index -= 1;
    }
    final item = _favouritePlaces.removeAt(oldIndex);
    _favouritePlaces.insert(index, item);
    notifyListeners();
  }

  void reorderVisited(int oldIndex, int newIndex) {
    var index = newIndex;
    if (oldIndex < newIndex) {
      index -= 1;
    }
    final item = _visitedPlaces.removeAt(oldIndex);
    _visitedPlaces.insert(index, item);
    notifyListeners();
  }
}
