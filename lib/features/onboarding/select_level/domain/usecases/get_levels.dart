import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/repositories/level_repository.dart';

@lazySingleton
class GetLevels {
  final LevelRepository levelRepository;

  GetLevels(this.levelRepository);

  Future<Either<Failures, List<Level>>> call() {
    return levelRepository.getLevels();
  }
}
