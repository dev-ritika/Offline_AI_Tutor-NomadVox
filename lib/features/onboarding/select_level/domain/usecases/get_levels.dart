import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/repositories/level_repository.dart';

@lazySingleton
class GetLevels {
  final LevelRepository levelRepository;

  GetLevels(this.levelRepository);

  List<Level> call() {
    return levelRepository.getLevelsListData();
  }
}
