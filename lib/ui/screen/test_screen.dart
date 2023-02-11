import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/colored_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(index: 4),
      body: Center(
        child: ColoredButton(
          text: 'DIO TEST',
          onPressed: () async {
            //data = await getPosts();
            data = await PlaceRepository().getPlaces();
            // ignore: avoid_print, avoid_dynamic_calls
            print(data[0].urls);
          },
        ),
      ),
    );
  }
}

///
///
///
///
///

const testUrl = 'https://jsonplaceholder.typicode.com';

final dio = Dio(baseoptions);

BaseOptions baseoptions = BaseOptions(
  baseUrl: testUrl,
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  // ignore: avoid_redundant_argument_values
  responseType: ResponseType.json,
);

Future<dynamic> getPosts() async {
  initInterceptors();

  final response = await dio.get<String>('/users');
  if (response.statusCode == 200) {
    return response.data;
  }
  throw Exception('No 200 status code: Error code: ${response.statusCode}');
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
