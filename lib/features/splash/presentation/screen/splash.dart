import 'dart:async';

import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/config/routes/routes_names.dart';
import 'package:offline_ai_tutor/features/splash/presentation/widgets/splash_logo.dart';
import 'package:offline_ai_tutor/features/splash/presentation/widgets/splash_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacementNamed(RoutesNames.selectLanguageScreen);
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [SplashLogo(), SplashText()],
      ),
    );
  }
}
