import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/presentation/cubit/levels_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/presentation/cubit/levels_state.dart';

class LevelButtons extends StatelessWidget {
  const LevelButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      LevelsCubit,
      LevelsState,
      ({List<Level>? levelList, Level? selectedLevel})
    >(
      selector: (state) =>
          (levelList: state.levelsList, selectedLevel: state.selectedLevel),
      builder: (context, state) {
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: state.levelList?.length ?? 0,
            itemBuilder: (context, index) {
              return SelectableContainer(
                onTap: () {
                  context.read<LevelsCubit>().selectLevel(
                    state.levelList![index],
                  );
                },
                title: state.levelList![index].title,
                subtitle: state.levelList![index].subTitle,

                //todo
                isSelected:
                    state.levelList![index].title == state.selectedLevel?.title,
              );
            },
          ),
        );
      },
    );
  }
}
