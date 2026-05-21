import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_dm.dart';

class LanguageLocalDS {
  Future<List<LanguageDm>> fetchLanguages() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/files/languages.json',
      );

      final List<dynamic> jsonList = jsonDecode(jsonString);

      List<LanguageDm> languagesList = jsonList
          .map((x) => LanguageDm.fromJson(data: x))
          .toList();

      return languagesList;
    } catch (e) {
      rethrow;
    }
  }
}
