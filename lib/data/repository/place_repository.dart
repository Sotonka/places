import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:places/data/model/place.dart';

const url = 'https://test-backend-flutter.surfstudio.ru';

final dio = Dio(baseOptions);

BaseOptions baseOptions = BaseOptions(
  baseUrl: url,
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  // ignore: avoid_redundant_argument_values
  responseType: ResponseType.json,
);

class PlaceRepository {
  Future<List<Place>> getPlaces() async {
    initInterceptors();

    final response = await dio.get<String>('/place');
    if (response.statusCode == 200) {
      final dynamic placesListJson = jsonDecode(response.data ?? '');

      return (placesListJson as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .map(Place.fromJson)
          .toList();
    }
    throw Exception('No 200 status code: Error code: ${response.statusCode}');
  }

  Future<Place> getPlace(int id) async {
    initInterceptors();

    final response = await dio.get<String>('/place/$id');
    if (response.statusCode == 200) {
      final dynamic placeJson = jsonDecode(response.data ?? '');

      return Place.fromJson(placeJson as Map<String, dynamic>);
    }
    throw Exception('No 200 status code: Error code: ${response.statusCode}');
  }

  Future<String> postPlace(Place place) async {
    initInterceptors();

    final response = await dio.post<String>(
      '/place',
      data: jsonEncode(
        place.toJson(),
      ),
      // TODO ниже рабочая
      /* data: jsonEncode(
        <String, dynamic>{
          'id': 888797,
          'lat': 0,
          'lng': 0,
          'name': 'test97',
          'urls': ['test97'],
          'placeType': 'cafe',
          'description': 'test97',
        },
      ), */
    );

    if (response.statusCode == 200) {
      return response.data ?? '';
    }
    throw Exception('No 200 status code: Error code: ${response.statusCode}');
  }
}

void initInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        // ignore: avoid_print
        //print(e.message);

        return handler.next(e);
      },
      onRequest: (options, handler) {
        // ignore: avoid_print
        print('Запрос отправляется');

        return handler.next(options);
      },
      onResponse: (e, handler) {
        // ignore: avoid_print
        print('Ответ получен');

        return handler.next(e);
      },
    ),
  );
}
