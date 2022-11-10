import 'package:places/domain/coordinates.dart';

enum SightType {
  cafe,
  hotel,
  museum,
  park,
  particular,
  restaurant,
}

class Sight {
  final String name;
  final Coord coord;
  final String url;
  final String details;
  final SightType type;
  final String? visitTime;
  final String? visited;
  final String? opensAt;

  String get typeAsText =>
      _typeTranslations[type.toString()] ??
      type.toString().replaceAll(RegExp(r'.*\.'), '');

  Sight({
    required this.name,
    required this.coord,
    required this.url,
    required this.details,
    required this.type,
    this.visitTime,
    this.visited,
    this.opensAt,
  });
}

final Map<String, String> _typeTranslations = {
  'SightType.cafe': 'кафе',
  'SightType.restaurant': 'ресторан',
  'SightType.park': 'парк',
  'SightType.museum': 'музей',
};
