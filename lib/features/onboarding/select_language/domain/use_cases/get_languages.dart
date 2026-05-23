import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/core/use_case/usecase.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/language_repo.dart';

@lazySingleton
class GetLanguages implements Usecase<List<Language>, NoParams> {
  final LanguageRepository languageRepository;

  GetLanguages({required this.languageRepository});

  @override
  Future<Either<Failures, List<Language>>> call(NoParams params) async {
    final Either<Failures, List<Language>> languageList =
        await languageRepository.getLanguages();

    return languageList;
  }
}
