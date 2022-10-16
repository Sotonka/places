import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      // home: MyFirstWidget(),
      home: const MySecondWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  MyFirstWidget({super.key});

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    _count++;
    debugPrint('Функция вызвана $_count раз');
    return Container(
      child: const Center(
        child: Text('Hello!'),
      ),
    );
  }
}

class MySecondWidget extends StatefulWidget {
  const MySecondWidget({super.key});

  @override
  State<MySecondWidget> createState() => _MySecondWidgetState();
}

class _MySecondWidgetState extends State<MySecondWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    _count++;
    debugPrint('Функция вызвана $_count раз');
    return Container(
      child: const Center(
        child: Text('Hello!'),
      ),
    );
  }
}
