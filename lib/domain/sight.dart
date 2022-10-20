enum SightType {
  cafe,
  restaurant,
  park,
  museum,
}

class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final SightType type;

  String get typeAsText =>
      _typeTranslations[type.toString()] ??
      type.toString().replaceAll(RegExp(r'.*\.'), '');

  Sight({
    required this.name,
    required this.lat,
    required this.lon,
    required this.url,
    required this.details,
    required this.type,
  });
}

final Map<String, String> _typeTranslations = {
  'SightType.cafe': 'кафе',
  'SightType.restaurant': 'ресторан',
  'SightType.park': 'парк',
  'SightType.museum': 'музей',
};
