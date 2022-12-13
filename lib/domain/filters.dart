import 'dart:collection';

import 'package:places/domain/sight.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/utils/utils.dart';

class Filter {
  final UnmodifiableSetView<SightType> categories;
  final Range<double> distance;

  Filter({
    Set<SightType>? categories,
    this.distance =
        const Range<double>(AppConstants.minDistance, AppConstants.maxDistance),
  }) : categories = UnmodifiableSetView<SightType>(categories ?? {});

  Filter toggleCategory(SightType type) {
    final s = categories.toSet();
    categories.contains(type) ? s.remove(type) : s.add(type);

    return copyWith(categories: s);
  }

  Filter copyWith({Set<SightType>? categories, Range<double>? distance}) =>
      Filter(
        categories: categories == null
            ? this.categories
            : UnmodifiableSetView<SightType>(categories),
        distance: distance ?? this.distance,
      );

  Filter clear() => Filter(
        categories: {},
      );

  bool isEmpty() {
    if (categories.isEmpty &&
        distance.start == AppConstants.minDistance &&
        distance.end == AppConstants.maxDistance) {
      return true;
    }

    return false;
  }
}
