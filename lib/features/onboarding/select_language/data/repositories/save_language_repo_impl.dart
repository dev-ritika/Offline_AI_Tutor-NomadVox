import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/save_language_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/selected_language_repo.dart';

@LazySingleton(as: SelectedLanguageRepository)
class SaveLanguageRepoImpl implements SelectedLanguageRepository {
  final SaveLanguageLocallyDataSource saveLanguageLocallyDataSource;

  const SaveLanguageRepoImpl({required this.saveLanguageLocallyDataSource});

  @override
  Future<Either<Failures, void>> saveSelectedLanguage(
    Language languageData,
  ) async {
    try {
      final LanguageModel languageModel = LanguageModel.fromDomain(
        languageData,
      );

      await saveLanguageLocallyDataSource.saveLanguage(languageModel);

      return const Right(null);
    } catch (e) {
      return const Left(AssetFailure("Something went wrong"));
    }
  }
}
