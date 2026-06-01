import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/level_data_model.dart';

abstract interface class LevelLocalDataSource {
  List<LevelDataModel> getLevelsList();
}

@LazySingleton(as: LevelLocalDataSource)
class LevelLocalDataSourceImpl implements LevelLocalDataSource {
  const LevelLocalDataSourceImpl();

  @override
  List<LevelDataModel> getLevelsList() {
    return LevelDataModel.getList;
  }
}
