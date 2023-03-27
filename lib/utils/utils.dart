import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/domain/coordinates.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class Utils {
  Utils();

  bool arePointsNear({
    required Coord checkPoint,
    required Coord centerPoint,
    required double kmStart,
    required double kmEnd,
  }) {
    const ky = 40000 / 360;
    final kx = cos(pi * centerPoint.lat / 180.0) * ky;
    final dx = (centerPoint.lon - checkPoint.lon).abs() * kx;
    final dy = (centerPoint.lat - checkPoint.lat).abs() * ky;

    return sqrt(dx * dx + dy * dy) <= kmEnd &&
        sqrt(dx * dx + dy * dy) >= kmStart;
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
    String nextField,
  ) {
    currentFocus.unfocus();
    if (nextField.isEmpty) {
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }

  Sight getById(int id) {
    final list = <Sight>[];

    for (final element in mocks) {
      if (element.id == id.toString()) {
        list.add(element);
      }
    }

    return list[0];
  }
}

class Range<T> {
  final T start;
  final T end;
  const Range(this.start, this.end);

  @override
  String toString() => '[$start .. $end]';
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

int generateId(String letters) {
  var result = 0;
  for (var i = 0; i < letters.length; i++) {
    result = result * 26 + (letters.codeUnitAt(i) & 0x1f);
  }

  return result;
}
