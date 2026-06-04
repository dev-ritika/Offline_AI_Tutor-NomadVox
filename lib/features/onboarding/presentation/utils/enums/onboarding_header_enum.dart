import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';

enum OnboardingStepEnum {
  language(
    title: StringConsts.selectLanguageTitle,
    subtitle: StringConsts.selectLanguageSubTitle,
    currentStep: 1,
    totalStep: 4,
  ),

  level(
    title: StringConsts.selectLevelTitle,
    subtitle: StringConsts.selectLevelSubTitle,
    currentStep: 2,
    totalStep: 4,
  ),

  name(
    title: StringConsts.enterNameTitle,
    subtitle: StringConsts.enterNameSubTitle,
    currentStep: 3,
    totalStep: 4,
  ),

  models(
    title: StringConsts.installModelsTitle,
    subtitle: StringConsts.installModelsSubTitle,
    currentStep: 4,
    totalStep: 4,
  );

  final String title;
  final String subtitle;
  final int currentStep;
  final int totalStep;

  const OnboardingStepEnum({
    required this.title,
    required this.subtitle,
    required this.currentStep,
    this.totalStep = 4,
  });

  OnboardingStepEnum? get next =>
      index + 1 >= values.length ? null : values[index + 1];

  OnboardingStepEnum? get back {
    return index - 1 < 0 ? null : values[index - 1];
  }
}
