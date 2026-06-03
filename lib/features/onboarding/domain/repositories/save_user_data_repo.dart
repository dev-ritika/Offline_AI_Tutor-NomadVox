import 'package:dartz/dartz.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/user_data.dart';

abstract interface class SaveUserDataRepo {
  Future<Either<Failures, void>> saveUserData(UserData languageData);
}
