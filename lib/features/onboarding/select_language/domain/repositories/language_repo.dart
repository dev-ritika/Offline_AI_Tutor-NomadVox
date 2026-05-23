import 'package:dartz/dartz.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

abstract interface class LanguageRepository {
  Future<Either<Failures, List<Language>>> getLanguages();
}
