import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/config/routes/routes_names.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/screen/onboarding.dart';

class RoutesConfig {
  RoutesConfig._();

  static Map<String, WidgetBuilder> getRoutes = {
    RoutesNames.onboardingScreen: (_) => const OnboardingScreen(),
    // RoutesNames.selectLevelScreen: (_) => const SelectLevelScreen(),
  };
}
