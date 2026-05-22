import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/config/routes/routes_config.dart';
import 'package:offline_ai_tutor/config/theme/theme_config.dart';
import 'package:offline_ai_tutor/core/dependency_injection/dependency_injection.dart';
import 'package:offline_ai_tutor/features/splash/presentation/screen/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependency();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesConfig.getRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeConfig.appThemeData(),
      home: const SplashScreen(),
    );
  }
}
