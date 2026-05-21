import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language_model.dart';

class LanguagesState extends Equatable {
  // final String? langName;
  // final String? nativeName;
  // final String? langCode;
  // final String? speakers;

  // const LanguagesState({
  //   this.langCode,
  //   this.langName,
  //   this.nativeName,
  //   this.speakers,
  // });

  // @override
  // List<Object?> get props => [langName, nativeName, langCode, speakers];

  // LanguagesState copyWith({
  //   String? langName,
  //   String? nativeName,
  //   String? langCode,
  //   String? speakers,
  // }) {
  //   return LanguagesState(
  //     langCode: langCode ?? this.langCode,
  //     langName: langName ?? this.langName,
  //     nativeName: nativeName ?? this.nativeName,
  //     speakers: speakers ?? this.speakers,
  //   );
  // }

  final List<LanguageModel>? languagesList;

  const LanguagesState({this.languagesList});

  LanguagesState copyWith({List<LanguageModel>? languagesList}) {
    return LanguagesState(languagesList: languagesList ?? this.languagesList);
  }

  @override
  List<Object?> get props => [languagesList];
}
