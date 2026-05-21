import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language_model.dart';

abstract class LanguageRepo {
  Future<List<LanguageModel>> getLanguages();
}
