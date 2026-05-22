import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/language_local_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/language_repo.dart';

class LanguageRepoImpl implements LanguageRepo {
  final LanguageLocalDataSourceImpl languageDataSource;

  LanguageRepoImpl({required this.languageDataSource});

  @override
  Future<List<Language>> getLanguages() async {
    try {
      final List<LanguageModel> languagesList = await languageDataSource
          .fetchLanguages();

      final List<Language> languages = languagesList.map((e) {
        return e.toDomain();
      }).toList();

      return languages;
    } catch (e) {
      rethrow;
    }
  }
}
