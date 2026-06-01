import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/storage/hive/hive_boxes_names.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/language_model.dart';

abstract interface class HiveInitializer {
  Future<void> init();
}

@LazySingleton(as: HiveInitializer)
class HiveInitializerImpl implements HiveInitializer {
  @override
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(LanguageModelAdapter());

    await Future.wait([
      Hive.openBox<LanguageModel>(HiveBoxesNames.userPrefsBox),
    ]);
  }
}
