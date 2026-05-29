import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/onboarding_header_enum.dart';

class OnboardingState extends Equatable {
  final int currentStep;
  final OnboardingHeaderEnum onboardingHeader;

  const OnboardingState({this.currentStep = 1, required this.onboardingHeader});

  const OnboardingState.initialState()
    : currentStep = 1,
      onboardingHeader = OnboardingHeaderEnum.language;

  OnboardingState copyWith({
    int? currentStep,
    OnboardingHeaderEnum? onboardingHeader,
  }) {
    return OnboardingState(
      onboardingHeader: onboardingHeader ?? this.onboardingHeader,
      currentStep: currentStep ?? this.currentStep,
    );
  }

  @override
  List<Object?> get props => [currentStep, onboardingHeader];
}
