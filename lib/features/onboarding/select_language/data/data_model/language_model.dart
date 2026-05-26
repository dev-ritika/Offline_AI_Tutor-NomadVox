import 'package:hive/hive.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
part 'language_model.g.dart';

@HiveType(typeId: 0)
class LanguageModel extends HiveObject {
  @HiveField(0)
  final String langName;

  @HiveField(1)
  final String nativeName;

  @HiveField(2)
  final String langCode;

  @HiveField(3)
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

  factory LanguageModel.fromDomain(Language language) {
    return LanguageModel(
      langCode: language.langCode,
      langName: language.langName,
      nativeName: language.nativeName,
      speakers: language.speakers,
    );
  }
}
