import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/level_data_model.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/level_local_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/level_repository.dart';

@LazySingleton(as: LevelRepository)
class LevelRepoImpl implements LevelRepository {
  final LevelLocalDataSource levelLocalDataSource;

  LevelRepoImpl(this.levelLocalDataSource);

  @override
  Future<Either<Failures, List<Level>>> getLevels() async {
    final List<LevelDataModel> data = levelLocalDataSource.getLevelsList();

    final List<Level> levelsList = data.map((x) => x.toDomain()).toList();

    return right(levelsList);
  }
}
