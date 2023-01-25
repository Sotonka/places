import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/ui/widget/bottom_nav_bar.dart';
import 'package:places/ui/widget/colored_button.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorsSwapper(),
      child: const _TestScreen(),
    );
  }
}

class _TestScreen extends StatefulWidget {
  const _TestScreen();

  @override
  State<_TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<_TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(index: 4),
      body: Center(
        child: ColoredButton(
          text: 'TO MAIN',
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRouter.splashScreen,
            );
          },
        ),
      ),
    );
  }
}

class WidgenOne extends StatelessWidget {
  const WidgenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 200,
          height: 200,
          color: context.watch<ColorsSwapper>().color,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _Purple(),
            _Yellow(),
          ],
        ),
        const _Randomizer(),
      ],
    );
  }
}

class _Purple extends StatelessWidget {
  const _Purple();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.read<ColorsSwapper>().toPurple,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.purple,
      ),
    );
  }
}

class _Yellow extends StatelessWidget {
  const _Yellow();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.read<ColorsSwapper>().toYellow,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.yellow,
      ),
    );
  }
}

class _Randomizer extends StatefulWidget {
  const _Randomizer();

  @override
  State<_Randomizer> createState() => __RandomizerState();
}

class __RandomizerState extends State<_Randomizer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: context.read<ColorsSwapper>().toRandom,
      child: Container(
        width: 100,
        height: 50,
        color: Colors.blue,
      ),
    );
  }
}

class ColorsSwapper extends ChangeNotifier {
  Color get color => _color;

  Color _color = Colors.grey;

  void toPurple() {
    _color = Colors.purple;
    notifyListeners();
  }

  void toYellow() {
    _color = Colors.yellow;
    notifyListeners();
  }

  void toRandom() {
    _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    notifyListeners();
  }
}
