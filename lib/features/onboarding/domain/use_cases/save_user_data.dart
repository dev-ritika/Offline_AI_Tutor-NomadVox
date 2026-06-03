import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/usecase.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/user_data.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/save_user_data_repo.dart';

@lazySingleton
class SaveUserData implements Usecase<void, UserData> {
  final SaveUserDataRepo saveUserDataRepo;

  SaveUserData({required this.saveUserDataRepo});

  @override
  Future<Either<Failures, void>> call(UserData params) async {
    final data = await saveUserDataRepo.saveUserData(params);

    return data;
  }
}
