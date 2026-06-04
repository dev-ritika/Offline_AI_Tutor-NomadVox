import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/enums/onboarding_header_enum.dart';

class OnboardingState extends Equatable {
  final OnboardingStepEnum currentStep;
  final Language? selectedLanguage;
  final Level? selectedLevel;
  final String? enteredName;
  final List<Language>? languagesList;
  final List<Level>? levelsList;
  final StateStatusEnum status;
  final Failures? error;

  final bool installedAllModels;

  const OnboardingState({
    this.selectedLanguage,
    this.languagesList,
    this.levelsList,
    this.selectedLevel,
    this.enteredName,
    this.status = StateStatusEnum.empty,
    this.error,
    this.currentStep = OnboardingStepEnum.language,
    this.installedAllModels = false,
  });

  OnboardingState copyWith({
    Language? selectedLanguage,
    List<Language>? languagesList,
    StateStatusEnum? status,
    OnboardingStepEnum? currentStep,
    List<Level>? levelsList,
    String? enteredName,
    Level? selectedLevel,
    Failures? error,
    bool clearLanguageSelection = false,
    bool clearLevelSelection = false,
    bool clearError = false,
    bool installedAllModels = false,
  }) {
    return OnboardingState(
      enteredName: enteredName ?? this.enteredName,
      levelsList: levelsList ?? this.levelsList,
      currentStep: currentStep ?? this.currentStep,
      languagesList: languagesList ?? this.languagesList,
      status: status ?? this.status,
      error: clearError ? null : error ?? this.error,

      installedAllModels: installedAllModels,

      selectedLevel: clearLevelSelection
          ? null
          : selectedLevel ?? this.selectedLevel,
      selectedLanguage: clearLanguageSelection
          ? null
          : selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  List<Object?> get props => [
    currentStep,
    languagesList,
    status,
    selectedLanguage,
    error,
    selectedLevel,
    levelsList,
    enteredName,
    installedAllModels,
  ];

  bool get isLoading => status == StateStatusEnum.loading;

  bool get isEnabled => switch (currentStep) {
    OnboardingStepEnum.language => selectedLanguage != null,
    OnboardingStepEnum.level => selectedLevel != null,
    OnboardingStepEnum.name => (enteredName?.length ?? 0) >= 2,
    OnboardingStepEnum.models => installedAllModels,
    // _ => false,
  };
}
