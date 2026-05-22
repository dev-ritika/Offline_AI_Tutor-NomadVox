import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/language_repo.dart';

class GetUser {
  final LanguageRepo languageRepo;

  GetUser({required this.languageRepo});

  Future<List<Language>> call() async {
    try {
      final List<Language> languageList = await languageRepo.getLanguages();
      return languageList;
    } catch (e) {
      rethrow;
    }
  }
}
