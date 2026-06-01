import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/onboarding_header_enum.dart';

class OnboardingState extends Equatable {
  // final int currentStep;
  final OnboardingStepEnum currentStep;
  final Language? selectedLanguage;

  //TO DO level type
  final selectedLevel;
  final List<Language>? languagesList;
  final List<Level>? levelsList;
  final StateStatusEnum status;
  final Failures? error;

  const OnboardingState({
    this.selectedLanguage,
    this.languagesList,
    this.levelsList,
    this.selectedLevel,
    required this.status,
    this.error,
    required this.currentStep,
  });

  const OnboardingState.initialState()
    : currentStep = OnboardingStepEnum.language,
      languagesList = const [],
      levelsList = const [],
      selectedLevel = null,
      status = StateStatusEnum.empty,
      error = null,
      selectedLanguage = null;

  OnboardingState copyWith({
    Language? selectedLanguage,
    List<Language>? languagesList,
    StateStatusEnum? status,
    OnboardingStepEnum? currentStep,
    List<Level>? levelsList,
    selectedLevel,
    Failures? error,
    bool clearLanguageSelection = false,
    bool clearLevelSelection = false,
  }) {
    return OnboardingState(
      levelsList: levelsList ?? this.levelsList,
      currentStep: currentStep ?? this.currentStep,
      languagesList: languagesList ?? this.languagesList,
      status: status ?? this.status,
      error: error ?? this.error,
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
  ];

  bool get isLoading => status == StateStatusEnum.loading;

  bool get isEnabled => switch (currentStep) {
    OnboardingStepEnum.language => selectedLanguage != null,
    OnboardingStepEnum.level => selectedLevel != null,
    _ => false,
  };
}
