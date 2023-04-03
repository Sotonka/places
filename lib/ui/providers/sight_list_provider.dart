import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/filters.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widget/error_dialog.dart';
import 'package:places/utils/utils.dart';

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
    // места беру которые уже есть в БД, место с id некорректное, так что просто
    // таким образом его не включаю
    for (final place in data) {
      if (place.id != 530) {
        _placeList.add(place);
      }
    }
    notifyListeners();
  }

  Future<void> loadFilteredPlaces(
    Filter filter,
  ) async {
    _placeList.clear();
    final loadedData = await PlaceInteractor().getFilteredPlaces(filter);
    loadedData.fold(
      (left) {
        _showErrorDialog();
      },
      renewPlaceList,
    );

    await Future<void>.delayed(const Duration(seconds: 1));
    _isloading = false;

    notifyListeners();
  }

  Future _showErrorDialog() {
    final context = NavigationService.navigatorKey.currentContext;

    return showDialog<void>(
      context: context!,
      builder: (context) {
        return const Center(child: ErrorDialog());
      },
    );
  }
}
