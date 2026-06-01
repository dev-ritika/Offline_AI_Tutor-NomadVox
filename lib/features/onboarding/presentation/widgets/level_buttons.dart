import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';

class LevelButtons extends StatelessWidget {
  const LevelButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      OnboardingCubit,
      OnboardingState,
      ({List<Level>? levelList, Level? selectedLevel})
    >(
      selector: (state) =>
          (levelList: state.levelsList, selectedLevel: state.selectedLevel),
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: state.levelList?.length ?? 0,
          itemBuilder: (context, index) {
            final data = state.levelList![index];
            return SelectableContainer(
              onTap: () {
                context.read<OnboardingCubit>().selectLevel(data);
              },
              title: data.title,
              subtitle: data.subTitle,
              isSelected: data == state.selectedLevel,
            );
          },
        );
      },
    );
  }
}
