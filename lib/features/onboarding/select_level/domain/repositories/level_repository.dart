import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';

abstract interface class LevelRepository {
  List<Level> getLevelsListData();
}
