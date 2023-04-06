import 'dart:collection';
import 'package:places/ui/ui_kit/ui_kit.dart';

class Filter {
  final UnmodifiableSetView<String> typeFilter;
  final String nameFilter;
  final double lat;
  final double lng;
  final double radius;

  Filter({
    Set<String>? typeFilter,
    this.nameFilter = '',
    this.lat = AppConstants.centerPointLat,
    this.lng = AppConstants.centerPointLon,
    this.radius = AppConstants.maxDistance,
  }) : typeFilter = UnmodifiableSetView<String>(typeFilter ??
            {
              ...AppConstants.placeTypes,
            });

  Filter toggleCategory(String type) {
    /// метод для переключения статуса значка категории на экране фильтра
    /// (on/ off), в зависимости от наличия добавляет или удаляет SightType
    /// из множества [categories]
    final s = typeFilter.toSet();
    typeFilter.contains(type) ? s.remove(type) : s.add(type);

    return copyWith(typeFilter: s);
  }

  Filter copyWith({
    Set<String>? typeFilter,
    String? nameFilter,
    double? radius,
  }) {
    return Filter(
      typeFilter: typeFilter == null
          ? this.typeFilter
          : UnmodifiableSetView<String>(typeFilter),
      nameFilter: nameFilter ?? this.nameFilter,
      radius: radius ?? this.radius,
    );
  }

  bool isEmpty() {
    if (typeFilter.contains(AppConstants.placeTypes[0]) &&
        typeFilter.contains(AppConstants.placeTypes[1]) &&
        typeFilter.contains(AppConstants.placeTypes[2]) &&
        typeFilter.contains(AppConstants.placeTypes[3]) &&
        typeFilter.contains(AppConstants.placeTypes[4]) &&
        typeFilter.contains(AppConstants.placeTypes[5]) &&
        radius == AppConstants.maxDistance) {
      return true;
    }

    return false;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lat': lat.toDouble(),
      'lng': lng.toDouble(),
      'radius': radius.toDouble(),
      'typeFilter': typeFilter.toList(),
      'nameFilter': nameFilter,
    };
  }
}
