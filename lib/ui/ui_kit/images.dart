import 'package:flutter/material.dart';

class ImageCollection {
  final String _defaultPath = 'res/images/';

  Image example({
    double? width,
    double? height,
    BoxFit? fill,
  }) =>
      Image.asset(
        _name('example.png'),
        width: width,
        height: height,
        fit: fill,
      );

  String _name(String name) => _defaultPath + name;
}
