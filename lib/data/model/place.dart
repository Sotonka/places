import 'package:places/ui/ui_kit/strings.dart';

class Place {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String>? urls;
  final String placeType;
  final String description;

  String get typeAsText => _typeTranslations[placeType.toString()] ?? '';

  Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] as int,
      lat: json['lat'] as double,
      lng: json['lng'] as double,
      name: json['name'] as String,
      urls: json['urls'] != null
          ? (json['urls'] as List<dynamic>).whereType<String>().toList()
          : null,
      placeType: json['placeType'] as String,
      description: json['description'] as String,
    );
  }

  @override
  String toString() {
    return 'Название: $name. Тип: $placeType. Ширина: $lat. Долгота: $lng.';
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'lat': lat,
      'lng': lng,
      'name': name,
      'urls': urls,
      'placeType': placeType,
      'description': description,
    };
  }
}

enum PlaceType {
  cafe,
  hotel,
  museum,
  park,
  particular,
  restaurant,
}

final Map<String, String> _typeTranslations = {
  'SightType.cafe': AppStrings.cafe,
  'SightType.restaurant': AppStrings.restaurant,
  'SightType.park': AppStrings.park,
  'SightType.museum': AppStrings.museum,
  'SightType.hotel': AppStrings.hotel,
  'SightType.particular': AppStrings.particular,
};
