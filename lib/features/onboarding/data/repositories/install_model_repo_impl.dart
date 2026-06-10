import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/network/helpers/download_model.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/install_model_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/install_model_repository.dart';

@LazySingleton(as: InstallModelRepository)
class InstallModelRepoImpl implements InstallModelRepository {
  final InstallModelDataSource installModelDataSource;

  InstallModelRepoImpl({required this.installModelDataSource});

  @override
  Stream<Either<Failures, DownloadModel>> installModels(String url) async* {
    final response = installModelDataSource.installModels(url);

    await for (var data in response) {
      yield data.fold((l) => left(l), (r) => right(r));
    }
  }
}
