import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';

enum OnboardingHeaderEnum {
  language(
    title: StringConsts.selectLanguageTitle,
    subtitle: StringConsts.selectLanguageSubTitle,
    currentStep: 1,
    totalStep: 3,
  ),

  level(
    title: StringConsts.selectLevelTitle,
    subtitle: StringConsts.selectLevelSubTitle,
    currentStep: 2,
    totalStep: 3,
  ),

  last(
    title: StringConsts.selectLevelTitle,
    subtitle: StringConsts.selectLevelSubTitle,
    currentStep: 3,
    totalStep: 3,
  );

  final String title;
  final String subtitle;
  final int currentStep;
  final int totalStep;

  const OnboardingHeaderEnum({
    required this.title,
    required this.subtitle,
    required this.currentStep,
    this.totalStep = 3,
  });
}
