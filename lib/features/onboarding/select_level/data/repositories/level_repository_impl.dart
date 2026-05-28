import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/data/data_model/level_data_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/data/data_source/level_local_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/repositories/level_repository.dart';

@LazySingleton(as: LevelRepository)
class LevelRepositoryImpl implements LevelRepository {
  final LevelLocalDataSource levelLocalDataSource;

  LevelRepositoryImpl(this.levelLocalDataSource);

  @override
  List<Level> getLevelsListData() {
    final List<LevelDataModel> data = levelLocalDataSource.getLevelsList();

    final List<Level> levelsList = data.map((x) => x.toDomain()).toList();

    return levelsList;
  }
}
