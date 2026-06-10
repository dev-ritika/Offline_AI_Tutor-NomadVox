import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/enums/model_install_status_enum.dart';

class ModelInstallData extends Equatable {
  final String id;
  final int index;
  final String name;
  final int installedPercentage;
  final ModelInstallStatusEnum installedStatus;

  const ModelInstallData({
    required this.id,
    required this.index,
    required this.name,
    required this.installedPercentage,
    required this.installedStatus,
  });

  factory ModelInstallData.initial() {
    return const ModelInstallData(
      id: "",
      index: 0,
      installedPercentage: 0,
      installedStatus: ModelInstallStatusEnum.Queued,
      name: "",
    );
  }

  ModelInstallData copyWith({
    String? id,
    int? index,
    String? name,
    int? installedPercentage,
    ModelInstallStatusEnum? installedStatus,
  }) {
    return ModelInstallData(
      id: id ?? this.id,
      index: index ?? this.index,
      name: name ?? this.name,
      installedPercentage: installedPercentage ?? this.installedPercentage,
      installedStatus: installedStatus ?? this.installedStatus,
    );
  }

  @override
  List<Object?> get props => [
    id,
    index,
    name,
    installedPercentage,
    installedStatus,
  ];
}
