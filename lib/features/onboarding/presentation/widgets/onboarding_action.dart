import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/onboarding_header_enum.dart';

class OnboardingAction extends StatelessWidget {
  final PageController pageController;
  const OnboardingAction({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnboardingCubit, OnboardingState, OnboardingHeaderEnum>(
      selector: (state) {
        return state.onboardingHeader;
      },
      builder: (context, state) {
        return PrimaryButton(
          buttonText: "Continue",
          onTap: () {
            if (state.currentStep < state.totalStep) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 1),
                curve: Curves.easeIn,
              );
              context.read<OnboardingCubit>().loadNextContent();
            } else {
              //TODO logic for navigation to next page
            }
          },
        );
      },
    );
  }
}
