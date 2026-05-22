import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

class LanguageModel {
  final String langName;
  final String nativeName;
  final String langCode;
  final String speakers;

  LanguageModel({
    required this.langCode,
    required this.langName,
    required this.nativeName,
    required this.speakers,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> data) {
    return LanguageModel(
      langCode: data['langCode'] as String? ?? "",
      langName: data['langName'] as String? ?? "",
      nativeName: data['nativeName'] as String? ?? "",
      speakers: data['speakers'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'langCode': langCode,
      'langName': langName,
      'nativeName': nativeName,
      'speakers': speakers,
    };
  }

  Language toDomain() {
    return Language(
      langCode: langCode,
      langName: langName,
      nativeName: nativeName,
      speakers: speakers,
    );
  }
}
