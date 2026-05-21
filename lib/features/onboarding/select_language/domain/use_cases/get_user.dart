import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/language_repo.dart';

class GetUser {
  final LanguageRepo languageRepo;

  GetUser({required this.languageRepo});

  Future<List<LanguageModel>> call() async {
    try {
      final List<LanguageModel> languageList = await languageRepo
          .getLanguages();
      return languageList;
    } catch (e) {
      rethrow;
    }
  }
}
