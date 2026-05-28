import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/core/dependency_injection/dependency_injection.dart';
import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/common_widgets/onboarding_header.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/presentation/cubit/levels_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/presentation/cubit/levels_state.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/presentation/widgets/level_buttons.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LevelsCubit>()..getLevelsList(),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
            child: Column(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnboardingHeader(
                        currentStep: 2,
                        totalStep: 3,
                        title: StringConsts.selectLevelTitle,
                        subtitle: StringConsts.selectLevelSubTitle,
                      ),
                      LevelButtons(),
                    ],
                  ),
                ),

                BlocSelector<LevelsCubit, LevelsState, bool>(
                  selector: (state) => state.isSelected,

                  builder: (context, isSelected) {
                    return PrimaryButton(
                      buttonText: StringConsts.continueText,
                      onTap: isSelected
                          ? () {
                              print("tapped object");
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
