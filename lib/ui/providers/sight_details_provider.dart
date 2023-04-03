import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';

class SightDetailsProvider extends ChangeNotifier {
  final _controller = PageController();

  PageController get controller => _controller;
  Place? get place => _place;
  int get page => _page;
  // ignore: unnecessary_getters_setters
  bool get isloading {
    return _isloading;
  }

  set isloading(bool value) {
    _isloading = value;
  }

  set page(int value) {
    _page = value;
    notifyListeners();
  }

  int _page = 0;
  bool _isloading = false;
  Place? _place;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> loadPlace(int id) async {
    final loadedPlace = await PlaceInteractor().getPlaceDetails(id);
    _isloading = false;

    loadedPlace.fold(
      (left) {
        _place = null;
      },
      (right) {
        _place = right;
      },
    );

    notifyListeners();
  }

  void initPage() {
    _page = 0;
  }
}
