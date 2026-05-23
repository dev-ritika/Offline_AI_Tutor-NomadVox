import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/exceptions.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/language_local_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/language_repo.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepoImpl implements LanguageRepository {
  final LanguageLocalDataSource languageDataSource;

  LanguageRepoImpl({required this.languageDataSource});

  @override
  Future<Either<Failures, List<Language>>> getLanguages() async {
    try {
      final List<LanguageModel> languagesList = await languageDataSource
          .fetchLanguages();

      final List<Language> languages = languagesList.map((e) {
        return e.toDomain();
      }).toList();

      // return left(AssetFailure("Asset loading failure "));
      return right(languages);
    } on LanguageDataException catch (e) {
      return left(AssetFailure("Asset loading failure $e"));
    } catch (e) {
      return left(AssetFailure("Asset loading failure $e"));
    }
  }
}
