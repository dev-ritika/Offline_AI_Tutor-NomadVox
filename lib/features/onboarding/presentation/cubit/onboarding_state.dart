import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/onboarding_header_enum.dart';

class OnboardingState extends Equatable {
  final OnboardingStepEnum currentStep;
  final Language? selectedLanguage;
  final Level? selectedLevel;
  final String? enteredName;
  final List<Language>? languagesList;
  final List<Level>? levelsList;
  final StateStatusEnum status;
  final Failures? error;

  const OnboardingState({
    this.selectedLanguage,
    this.languagesList,
    this.levelsList,
    this.selectedLevel,
    this.enteredName,
    this.status = StateStatusEnum.empty,
    this.error,
    this.currentStep = OnboardingStepEnum.language,
  });

  // const OnboardingState.initialState()
  //   : currentStep = OnboardingStepEnum.language,
  //     languagesList = const [],
  //     levelsList = const [],
  //     enteredName = '',
  //     selectedLevel = null,
  //     status = StateStatusEnum.empty,
  //     error = null,
  //     selectedLanguage = null;

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
  }) {
    return OnboardingState(
      enteredName: enteredName ?? this.enteredName,
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
    enteredName,
  ];

  bool get isLoading => status == StateStatusEnum.loading;

  bool get isEnabled => switch (currentStep) {
    OnboardingStepEnum.language => selectedLanguage != null,
    OnboardingStepEnum.level => selectedLevel != null,
    OnboardingStepEnum.name => (enteredName?.length ?? 0) >= 2,
    // _ => false,
  };
}
