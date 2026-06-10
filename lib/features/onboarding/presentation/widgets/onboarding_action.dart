import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/enums/onboarding_header_enum.dart';

class OnboardingAction extends StatelessWidget {
  const OnboardingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      OnboardingCubit,
      OnboardingState,
      ({OnboardingStepEnum currentStepData, bool isEnabled})
    >(
      selector: (state) {
        return (currentStepData: state.currentStep, isEnabled: state.isEnabled);
      },
      builder: (context, state) {
        print("am i enabed" + state.isEnabled.toString());

        return PrimaryButton(
          buttonText: state.currentStepData.next == null
              ? "Get Started"
              : "Continue",

          onTap: !state.isEnabled
              ? null
              : () => context.read<OnboardingCubit>().goNext(),
        );
      },
    );
  }
}
