import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/core/use_case/usecase.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/level_repository.dart';

@lazySingleton
class GetLevels implements Usecase<List<Level>, NoParams> {
  final LevelRepository levelRepository;

  GetLevels(this.levelRepository);

  @override
  Future<Either<Failures, List<Level>>> call(NoParams params) async {
    return await levelRepository.getLevels();
  }
}
