class Place {
  final String id;
  final double lat;
  final double lon;
  final String name;
  final List<String>? urls;
  final String placeType;
  final String description;

  Place({
    required this.id,
    required this.lat,
    required this.lon,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      // TODO ??
      id: json['id'].toString(),
      lat: json['lat'] as double,
      lon: json['lng'] as double,
      name: json['name'] as String,
      // TODO может быть пустым
      urls: json['urls'] != null
          ? (json['urls'] as List<dynamic>).whereType<String>().toList()
          : null,

      placeType: json['placeType'] as String,
      description: json['description'] as String,
    );
  }

  @override
  String toString() {
    return 'Название: $name. Тип: $placeType. Ширина: $lat. Долгота: $lon.';
  }
}
