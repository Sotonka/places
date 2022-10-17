import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text('Hello'),
            alignment: Alignment.center,
            width: 200,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
          ),
          TextFormField(),
        ],
      ),
    );
  }
}
