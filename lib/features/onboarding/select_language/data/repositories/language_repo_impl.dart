import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_dm.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/language_local_ds.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/language_repo.dart';

class LanguageRepoImpl implements LanguageRepo {
  final LanguageLocalDS langDS;

  LanguageRepoImpl({required this.langDS});

  @override
  Future<List<LanguageModel>> getLanguages() async {
    try {
      final List<LanguageDm> languagesList = await langDS.fetchLanguages();

      final List<LanguageModel> languages = languagesList.map((e) {
        return LanguageModel(
          langCode: e.langCode,
          langName: e.langName,
          nativeName: e.nativeName,
          speakers: e.speakers,
        );
      }).toList();

      return languages;
    } catch (e) {
      rethrow;
    }
  }
}
