import 'dart:collection';

import 'package:places/domain/sight.dart';
import 'package:places/ui/ui_kit/utils.dart';

class Filter {
  final UnmodifiableSetView<SightType> categories;
  final Range<double> distance;

  Filter({
    Set<SightType>? categories,
    this.distance = const Range<double>(0, 10000),
  }) : categories = UnmodifiableSetView<SightType>(categories ?? {});

  bool hasCategory(SightType type) => categories.contains(type);

  Filter toggleCategory(SightType type) {
    final s = categories.toSet();
    hasCategory(type) ? s.remove(type) : s.add(type);

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
        distance: const Range<double>(0, 10000),
      );
}
