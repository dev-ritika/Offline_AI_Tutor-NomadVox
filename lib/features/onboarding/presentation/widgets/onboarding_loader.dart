import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/utils/constants/color_consts.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingLoader extends StatelessWidget {
  const OnboardingLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      OnboardingCubit,
      OnboardingState,
      ({bool isLoading, bool isSaving})
    >(
      selector: (state) => (
        isLoading: state.isLoading,
        isSaving: state.status == StateStatusEnum.saving,
      ),
      builder: (context, data) => data.isLoading || data.isSaving
          ? Container(
              height: double.infinity,
              width: double.infinity,
              color: ColorConsts.blackOverlay,
              child: const Center(child: CircularProgressIndicator()),
            )
          : const SizedBox.shrink(),
    );
  }
}
