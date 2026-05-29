import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/onboarding_header_enum.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initialState());

  void loadNextContent() {
    switch (state.currentStep) {
      case (1):
        emit(state.copyWith(onboardingHeader: OnboardingHeaderEnum.language));
      case (2):
        emit(state.copyWith(onboardingHeader: OnboardingHeaderEnum.level));
      case (3):
        emit(state.copyWith(onboardingHeader: OnboardingHeaderEnum.last));
    }
    emit(state.copyWith(currentStep: state.currentStep + 1));
  }
}
