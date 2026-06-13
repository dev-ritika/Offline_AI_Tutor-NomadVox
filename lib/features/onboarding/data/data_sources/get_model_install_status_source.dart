import 'package:dartz/dartz.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/exceptions.dart';
import 'package:offline_ai_tutor/core/storage/hive/hive_keys.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/llm_model_install.dart';

abstract interface class GetModelInstallStatusSource {
  Either<Exception, List<LlmModelInstall>> getModelInstallStatus();
}

@LazySingleton(as: GetModelInstallStatusSource)
class GetModelInstallStatusSourceImpl implements GetModelInstallStatusSource {
  final Box<List> installStatusBox;

  const GetModelInstallStatusSourceImpl({
    @Named("modelsInstall") required this.installStatusBox,
  });

  @override
  Either<Exception, List<LlmModelInstall>> getModelInstallStatus() {
    try {
      final List<LlmModelInstall> data =
          installStatusBox
              .get(HiveKeys.modelInstallStatus)
              ?.cast<LlmModelInstall>() ??
          [];

      return right(data);
    } catch (e) {
      return left(NetworkException(message: "Exception"));
    }
  }
}
