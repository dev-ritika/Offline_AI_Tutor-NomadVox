import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/usecase.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/selected_language_repo.dart';

@lazySingleton
class SaveLanguage implements Usecase<void, Language> {
  final SelectedLanguageRepository selectedLanguageRepository;

  SaveLanguage({required this.selectedLanguageRepository});

  @override
  Future<Either<Failures, void>> call(Language params) async {
    final data = await selectedLanguageRepository.saveSelectedLanguage(params);

    return data;
  }
}
