import 'package:hive_ce/hive_ce.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/exceptions.dart';
import 'package:offline_ai_tutor/core/storage/hive/hive_keys.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';

abstract interface class SaveLanguageLocallyDataSource {
  Future<void> saveLanguage(LanguageModel selectedLanguage);
}

@LazySingleton(as: SaveLanguageLocallyDataSource)
class SaveLanguageLocallyDataSourceImpl
    implements SaveLanguageLocallyDataSource {
  final Box<LanguageModel> userPrefBox;

  SaveLanguageLocallyDataSourceImpl(@Named("userPrefs") this.userPrefBox);

  @override
  Future<void> saveLanguage(LanguageModel selectedLanguage) async {
    try {
      await userPrefBox.put(HiveKeys.selectedLanguageKey, selectedLanguage);

      final LanguageModel? data = userPrefBox.get(HiveKeys.selectedLanguageKey);

      print(data?.langName);
    } catch (e) {
      throw HiveDataException(message: "Something went wrong");
    }
  }
}
