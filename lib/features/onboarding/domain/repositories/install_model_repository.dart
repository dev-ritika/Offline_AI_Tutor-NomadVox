import 'package:dartz/dartz.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/network/helpers/download_model.dart';

abstract interface class InstallModelRepository {
  Stream<Either<Failures, DownloadModel>> installModels(String url);
}
