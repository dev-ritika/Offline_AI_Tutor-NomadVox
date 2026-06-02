import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/usecase.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/save_user_data_repo.dart';

@lazySingleton
class SaveLanguage implements Usecase<void, Language> {
  final SaveUserDataRepo saveUserDataRepo;

  SaveLanguage({required this.saveUserDataRepo});

  @override
  Future<Either<Failures, void>> call(Language params) async {
    final data = await saveUserDataRepo.saveUserData(params);

    return data;
  }
}
