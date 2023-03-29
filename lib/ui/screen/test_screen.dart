import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/providers/filter_provider.dart';
import 'package:places/ui/providers/sight_list_provider.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:places/ui/widget/sight_card_tab.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic data;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(index: 4),
      /*  body: Center(
        child: ColoredButton(
          text: 'DIO TEST',
          onPressed: () async {
            //data = await getPosts();
            data = await PlaceRepository().getPlaces();
            // ignore: avoid_print, avoid_dynamic_calls
            print(data[0].urls);
          },
        ),
      ), */
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              PlaceInteractor()
                  .getFilteresPlaces(context.read<FilterProvider>().filter);
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
              child: const Text('filter'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 50,
              height: 50,
              color: Colors.amber,
              child: const Text('post'),
            ),
          ),
          InkWell(
            onTap: () {
              //context.read<SightListProvider>().loadPlaces();
              PlaceInteractor().getPlaces();
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: const Text('get'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.read<SightListProvider>().placeList.length,
        itemBuilder: (context, index) {
          return context
                  .read<SightListProvider>()
                  .placeList[index]
                  .id
                  .toString()
                  .contains('8887')
              ? ListTile(
                  title: Text(
                    '${context.read<SightListProvider>().placeList[index].name} : ${context.read<SightListProvider>().placeList[index].id}',
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}

//place
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
      onError: (e, handler) {
        // ignore: avoid_print
        print(e.message);

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
