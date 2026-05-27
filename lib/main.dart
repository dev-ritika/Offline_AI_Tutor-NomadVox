import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline_ai_tutor/config/routes/routes_config.dart';
import 'package:offline_ai_tutor/config/theme/theme_config.dart';
import 'package:offline_ai_tutor/core/dependency_injection/dependency_injection.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';
import 'package:offline_ai_tutor/features/splash/presentation/screen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(LanguageModelAdapter());

  await Hive.openBox<LanguageModel>("user_language");

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
      title: 'Fluent Nomad',
      theme: ThemeConfig.appThemeData(),
      home: const SplashScreen(),
    );
  }
}
