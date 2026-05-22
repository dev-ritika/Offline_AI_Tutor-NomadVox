import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

abstract class LanguageRepo {
  Future<List<Language>> getLanguages();
}
