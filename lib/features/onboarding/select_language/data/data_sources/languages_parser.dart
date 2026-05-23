import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart';

@lazySingleton
class LanguagesParser {
  List<LanguageModel> getData(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);

    List<LanguageModel> languagesList = jsonList
        .map((x) => LanguageModel.fromJson(x))
        .toList();

    return languagesList;
  }
}
