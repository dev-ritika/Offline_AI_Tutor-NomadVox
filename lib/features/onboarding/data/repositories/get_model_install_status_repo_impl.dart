import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/exceptions.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/llm_model_install.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/get_model_install_status_source.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/model_install_data.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/get_model_install_status_repository.dart';

@LazySingleton(as: GetModelInstallStatusRepository)
class GetModelInstallStatusRepoImpl implements GetModelInstallStatusRepository {
  final GetModelInstallStatusSource getModelInstallStatusSource;

  GetModelInstallStatusRepoImpl({required this.getModelInstallStatusSource});

  @override
  Either<Failures, List<ModelInstallData>> getModelInstallStatus() {
    try {
      Either<Exception, List<LlmModelInstall>> data =
          getModelInstallStatusSource.getModelInstallStatus();

      return data.fold((l) => left(NetworkFailure(l.toString())), (r) {
        final List<ModelInstallData> data = r.map((e) => e.toDomain()).toList();

        return right(data);
      });
    } on NetworkException catch (e) {
      return left(NetworkFailure(e.message));
    } catch (e) {
      return left(NetworkFailure(e.toString()));
    }
  }
}
