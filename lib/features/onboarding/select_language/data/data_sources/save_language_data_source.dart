import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';

abstract interface class SaveLanguageLocallyDataSource {
  Future<void> saveLanguage(LanguageModel selectedLanguage);
}

@LazySingleton(as: SaveLanguageLocallyDataSource)
class SaveLanguageLocallyDataSourceImpl
    implements SaveLanguageLocallyDataSource {
  @override
  Future<void> saveLanguage(LanguageModel selectedLanguage) async {
    final Box<LanguageModel> box = await Hive.openBox<LanguageModel>(
      "User_Language",
    );

    await box.put("selected_language", "selectedLanguage" as LanguageModel);

    final LanguageModel? data = box.get("selected_language");

    print(data?.langName);
  }
}
