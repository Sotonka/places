import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen.dart';

class AddPhotoProvider extends ChangeNotifier {
  List<PhotoItem> get photoList => _photoList;

  List<PhotoItem> _photoList = [];

  void addPhoto() {
    _photoList.add(const PhotoItem());
    notifyListeners();
  }

  void removePhoto(int index) {
    _photoList.removeAt(index);
    notifyListeners();
  }

  void clearList() {
    _photoList = [];
  }
}
