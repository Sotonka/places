import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/domain/filters.dart';

class SearchProvider extends ChangeNotifier {
  final _searchController = TextEditingController();
  final _searchFocus = FocusNode();

  List<String> get history => _history;
  List<Place> get placeList => _placeList;
  FocusNode get searchFocus => _searchFocus;
  TextEditingController get searchController => _searchController;
  bool get searching => _searchFocus.hasFocus;
  bool get searchInitState =>
      _searchFocus.hasFocus && _searchController.text.isEmpty;

  String get submittedSearch => _submittedSearch;

  set submittedSearch(String value) {
    _submittedSearch = value;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  bool get isloading {
    return _isloading;
  }

  set isloading(bool value) {
    _isloading = value;
  }

  bool _isloading = false;
  List<Place> _placeList = [];
  List<String> _history = [];
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

  Future<void> findSights(
    Filter filter,
    String search,
  ) async {
    _submittedSearch = '';

    final loadedData = await PlaceInteractor().searchPlaces(filter, search);
    renewPlaceList(loadedData);
    await Future<void>.delayed(const Duration(seconds: 1));
    _isloading = false;

    notifyListeners();
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

  void newSightList(List<Place> list) {
    _placeList = list;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
