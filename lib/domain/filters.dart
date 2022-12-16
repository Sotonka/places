import 'dart:collection';

import 'package:places/domain/sight.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';
import 'package:places/utils/utils.dart';

class Filter {
  /// фильтр для списка мест
  /// [categories] - set с enum SightType, по умолчанию пустой
  /// [distance] - объект класса Range, имеет два поля - минимальный и
  /// максимальный радиус поиска
  final UnmodifiableSetView<SightType> categories;
  final Range<double> distance;

  Filter({
    Set<SightType>? categories,
    this.distance =
        const Range<double>(AppConstants.minDistance, AppConstants.maxDistance),
  }) : categories = UnmodifiableSetView<SightType>(categories ?? {});

  Filter toggleCategory(SightType type) {
    /// метод для переключения статуса значка категории на экране фильтра
    /// (on/ off), в зависимости от наличия добавляет или удаляет SightType
    /// из множества [categories]
    final s = categories.toSet();
    categories.contains(type) ? s.remove(type) : s.add(type);

    return copyWith(categories: s);
  }

  Filter copyWith({Set<SightType>? categories, Range<double>? distance}) {
    /// принимает необязательные [categories] и [distance],
    /// возвращает с ними новый [Filter]
    return Filter(
      categories: categories == null
          ? this.categories
          : UnmodifiableSetView<SightType>(categories),
      distance: distance ?? this.distance,
    );
  }

  Filter clear() {
    return Filter(
      categories: {},
    );
  }

  bool isEmpty() {
    if (categories.isEmpty &&
        distance.start == AppConstants.minDistance &&
        distance.end == AppConstants.maxDistance) {
      return true;
    }

    return false;
  }
}
