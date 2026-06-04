import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/enums/model_install_status_enum.dart';
import 'package:offline_ai_tutor/core/utils/helpers/container_color_model.dart';

class ModelsContainer extends StatelessWidget {
  const ModelsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableContainer(
      title: "abcd",
      subtitle: "efgh",
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
  }
}
