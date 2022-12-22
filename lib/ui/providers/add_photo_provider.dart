import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen.dart';

class AddPhotoProvider extends ChangeNotifier {
  final List<PhotoItem> _photoList = [];

  List<PhotoItem> get photoList => _photoList;

  void addPhoto() {
    _photoList.add(const PhotoItem());
    notifyListeners();
  }

  void removePhoto(int index) {
    _photoList.removeAt(index);
    notifyListeners();
  }
}
