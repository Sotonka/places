import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/colored_button.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Timer _timer;
  var _start = 0;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(index: 4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Text(
              _start.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 54,
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.all(16),
            child: ColoredButton(
              text: 'sync',
              onPressed: _functionOne,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: ColoredButton(
              text: 'async',
              onPressed: _functionTwo,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: ColoredButton(
              text: 'isolate',
              onPressed: _functionThree,
            ),
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    const interval = Duration(milliseconds: 30);
    _timer = Timer.periodic(
      interval,
      (timer) {
        if (_start == 999) {
          setState(() {
            _start = 0;
            //timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
      },
    );
  }
}

void _processString(int count) {
  var string = '';
  final sw = Stopwatch();

  Iterable<String> generator() sync* {
    for (var i = 0; i < count; i++) {
      yield 'qwerty';
    }
  }

  // ignore: avoid_print
  print('---START---');
  sw.start();

  generator().forEach((element) {
    string = element.split('').reversed.join();
  });

  sw.stop();
  // ignore: avoid_print
  print('---Затрачено: ${sw.elapsed}---');
  // ignore: avoid_print
  print('---STOP---');
}

void _functionOne() {
  _processString(10000000);
}

Future<void> _functionTwo() async {
  await Future(() {
    _processString(10000000);
  });

  //await Future<void>.delayed(const Duration(seconds: 4));
}

void _functionThree() {
  Isolate.spawn(_processString, 10000000);
}
