import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:places/data/exceptions/network_exception.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/domain/filters.dart';

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

    try {
      final response = await dio.get<String>('/place');

      final dynamic placesListJson = jsonDecode(response.data ?? '');

      return (placesListJson as List<dynamic>)
          .whereType<Map<String, dynamic>>()
          .map(Place.fromJson)
          .toList();
    } on DioError catch (e) {
      throw NetworkException(
        message: e.message,
      );
    }
  }

  Future<Place> getPlace(int id) async {
    initInterceptors();

    try {
      final response = await dio.get<String>('/place/$id');

      final dynamic placeJson = jsonDecode(response.data ?? '');

      return Place.fromJson(placeJson as Map<String, dynamic>);
    } on DioError catch (e) {
      throw NetworkException(
        message: e.message,
      );
    }
  }

  Future<String> postPlace(Place place) async {
    initInterceptors();

    try {
      final response = await dio.post<String>(
        '/place',
        data: jsonEncode(
          place.toJson(),
        ),
      );

      return response.data ?? '';
    } on DioError catch (e) {
      throw NetworkException(
        message: e.message,
      );
    }
  }

  Future<List<PlaceDto>> getFilteredPlaces(Filter filter) async {
    initInterceptors();

    try {
      final response = await dio.post<String>(
        '/filtered_places',
        data: jsonEncode(
          filter.toJson(),
        ),
      );

      final dynamic list = jsonDecode(response.data ?? '');

      return (list as List<dynamic>)
          // ignore: avoid_annotating_with_dynamic
          .map((dynamic e) => PlaceDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw NetworkException(
        message: e.message,
      );
    }
  }

  Future<List<PlaceDto>> searchPlaces(
    Filter filter,
    String name,
  ) async {
    initInterceptors();
    final searchFilter = filter.copyWith(nameFilter: name);

    try {
      final response = await dio.post<String>(
        '/filtered_places',
        data: jsonEncode(
          searchFilter.toJson(),
        ),
      );

      final dynamic list = jsonDecode(response.data ?? '');

      return (list as List<dynamic>)
          // ignore: avoid_annotating_with_dynamic
          .map((dynamic e) => PlaceDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      throw NetworkException(
        message: e.message,
      );
    }
  }
}

void initInterceptors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
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
