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
  Future<dynamic> getPlaces() async {
    initInterceptors();

    final response = await dio.get<String>('/place');
    if (response.statusCode == 200) {
      final dynamic placesListJson = jsonDecode(response.data ?? '');

      /* return (placesListJson as List<dynamic>)
          // ignore: avoid_annotating_with_dynamic
          .map((dynamic place) => Place.fromJson(place as Map<String, dynamic>))
          .toList(); */

      // ignore: avoid_print, avoid_dynamic_calls
      /* print((placesListJson[0]['urls'] as List<dynamic>)
          .whereType<String>()
          .toList());
      // ignore: avoid_print
      print('___________________________________________');

      return placesListJson; */
      // ignore: avoid_annotating_with_dynamic, avoid_dynamic_calls
      //return Place.fromJson(placesListJson[0] as Map<String, dynamic>);

      //TODO ниже рабочая

      return (placesListJson as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .map(Place.fromJson)
          .toList();
    }
    throw Exception('No 200 status code: Error code: ${response.statusCode}');
  }
}

void initInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {},
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
