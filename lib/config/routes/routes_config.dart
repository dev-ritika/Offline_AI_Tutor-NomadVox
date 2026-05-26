import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/config/routes/routes_names.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/screen/select_language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/presentation/screen/select_level.dart';

class RoutesConfig {
  RoutesConfig._();

  static Map<String, WidgetBuilder> getRoutes = {
    RoutesNames.selectLanguageScreen: (_) => const SelectLanguageScreen(),
    RoutesNames.selectLevelScreen: (_) => const SelectLevelScreen(),
  };
}
