import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class VisitingProvider extends ChangeNotifier {
  // TODO
  // пока список создается из всех элементов mocks,
  // соответственно при каждом переходе на VisitingScreen все удаленные
  // элементы будут восстанавливаться
  // когда у моделей появятся поля  - буду фильтровать по ним
  final List<Sight> _wishlistList = List<Sight>.from(mocks);
  final List<Sight> _visitedList = List<Sight>.from(mocks);

  TabController get tabController => _tabController;
  List<Sight> get wishlistList => _wishlistList;
  List<Sight> get visitedList => _visitedList;

  set tabController(TabController value) {
    _tabController = value;
    notifyListeners();
  }

  late TabController _tabController;

  void removeFromWishlist(Sight sight) {
    _wishlistList.removeWhere((element) => element.id == sight.id);
    notifyListeners();
  }

  void removeFromVisited(Sight sight) {
    _visitedList.removeWhere((element) => element.id == sight.id);
    notifyListeners();
  }

  void reorderWishlist(int oldIndex, int newIndex) {
    var index = newIndex;
    if (oldIndex < newIndex) {
      index -= 1;
    }
    final item = _wishlistList.removeAt(oldIndex);
    _wishlistList.insert(index, item);
    notifyListeners();
  }

  void reorderVisited(int oldIndex, int newIndex) {
    var index = newIndex;
    if (oldIndex < newIndex) {
      index -= 1;
    }
    final item = _visitedList.removeAt(oldIndex);
    _visitedList.insert(index, item);
    notifyListeners();
  }
}
