import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/languages_buttons.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/level_buttons.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/name_field.dart';

class OnboardingContent extends StatelessWidget {
  final PageController pageController;
  const OnboardingContent({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) =>
          previous.currentStep != current.currentStep,
      listener: (context, state) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );

        switch (state.status) {
          case (StateStatusEnum.error):
            Fluttertoast.showToast(
              msg: state.error?.message ?? "Something went wrong",
            );
          case (StateStatusEnum.saved):
            print("navigate"); //TO DO code to navigate next screen
          default:
            null;
        }
      },
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),

        children: const [LanguagesButtons(), LevelButtons(), NameField()],
      ),
    );
  }
}
