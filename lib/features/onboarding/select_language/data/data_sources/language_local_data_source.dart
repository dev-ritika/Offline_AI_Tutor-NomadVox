import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/exceptions.dart';
import 'package:offline_ai_tutor/core/utils/constants/assets_consts.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/languages_parser.dart';

abstract class LanguageLocalDataSource {
  Future<List<LanguageModel>> fetchLanguages();
}

@LazySingleton(as: LanguageLocalDataSource)
class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final AssetBundle rootBundle;
  final LanguagesParser languagesParser;

  const LanguageLocalDataSourceImpl({
    required this.rootBundle,
    required this.languagesParser,
  });

  @override
  Future<List<LanguageModel>> fetchLanguages() async {
    try {
      final String jsonString = await rootBundle.loadString(
        AssetsConsts.languagesJsonFile,
      );

      List<LanguageModel> languagesList = languagesParser.getData(jsonString);

      return languagesList;
    } on FormatException catch (e) {
      throw LanguageDataException(message: "Invalid format $e");
    } catch (e) {
      throw LanguageDataException(message: "Something went wrong $e");
    }
  }
}
