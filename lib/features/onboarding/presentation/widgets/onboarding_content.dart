import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/languages_buttons.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/level_buttons.dart';

class OnboardingContent extends StatelessWidget {
  final PageController pageController;
  const OnboardingContent({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [LanguagesButtons(), LevelButtons()],
    );
  }
}
