import 'package:flutter/material.dart';
import 'package:places/app_router.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final isInitialized = false;

  @override
  void initState() {
    _navigateToNext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.yellowF3D,
              AppColors.greenF50,
            ],
          ),
        ),
        child: Center(
          child: AppIcons.splash(
            color: AppColors.primaryLightFFF,
          ),
        ),
      ),
    );
  }
}

Future<void> _navigateToNext(BuildContext context) async {
  await Future<void>.delayed(const Duration(seconds: 2)).then((_) {
    // ignore: avoid_print
    print('Переход на следующий экран');
    Navigator.of(context).pushNamed(
      AppRouter.sights,
    );
  });
}
