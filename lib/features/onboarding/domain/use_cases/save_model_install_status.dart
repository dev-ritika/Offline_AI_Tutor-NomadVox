import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/model_install_data.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/save_model_install_status_repository.dart';

@lazySingleton
class SaveModelInstallStatus {
  final SaveModelInstallStatusrepository saveUserDataRepository;

  const SaveModelInstallStatus({required this.saveUserDataRepository});

  Future<Either<Failures, bool>> call(List<ModelInstallData> data) async {
    return await saveUserDataRepository.saveModelsInstallStatus(data);
  }
}
