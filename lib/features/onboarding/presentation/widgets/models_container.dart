import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/llm_model.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/enums/model_install_status_enum.dart';
import 'package:offline_ai_tutor/core/utils/helpers/container_color_model.dart';

class ModelsContainer extends StatelessWidget {
  const ModelsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnboardingCubit, OnboardingState, LLMModelEntity?>(
      selector: (state) {
        return state.modelsData;
      },
      builder: (context, data) {
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: data?.models.length ?? 0,
          itemBuilder: (context, index) {
            print(data?.models);
            return SelectableContainer(
              title: data?.models[index].displayName ?? "",
              subtitle: data?.models[index].subtitleDisplay ?? "",
              leadingItem: const CircleAvatar(
                radius: 20,
                child: Icon(Icons.import_contacts),
              ),
              bottemItem: LinearProgressIndicator(
                value: 0.8,
                minHeight: 3,
                color: ContainerColorModel.installationStatusColor(
                  ModelInstallStatusEnum.completed,
                ).progressBgColor,
                backgroundColor: Colors.grey,
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            );
          },
        );
      },
    );
  }
}
