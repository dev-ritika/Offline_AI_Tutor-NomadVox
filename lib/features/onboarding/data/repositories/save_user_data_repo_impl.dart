import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/exceptions.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/save_user_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/save_user_data_repo.dart';

@LazySingleton(as: SaveUserDataRepo)
class SaveUserDataRepoImpl implements SaveUserDataRepo {
  final SaveUserDataLocallyDataSource saveUserDataLocallyDataSource;

  const SaveUserDataRepoImpl({required this.saveUserDataLocallyDataSource});

  @override
  Future<Either<Failures, void>> saveUserData(Language languageData) async {
    try {
      final LanguageModel languageModel = LanguageModel.fromDomain(
        languageData,
      );

      await saveUserDataLocallyDataSource.saveLanguage(languageModel);

      return const Right(null);
    } on HiveDataException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
