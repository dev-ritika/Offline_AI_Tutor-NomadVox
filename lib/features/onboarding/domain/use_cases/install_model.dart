import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/network/helpers/download_model.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/install_model_repository.dart';

@lazySingleton
class InstallModel {
  final InstallModelRepository installModelRepository;

  InstallModel({required this.installModelRepository});

  Stream<Either<Failures, DownloadModel>> call(String url) async* {
    final response = installModelRepository.installModels(url);

    await for (var data in response) {
      yield data.fold((l) => left(l), (r) => right(r));
    }
  }
}
