import 'package:dartz/dartz.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';

abstract interface class LevelRepository {
  Future<Either<Failures, List<Level>>> getLevels();
}
