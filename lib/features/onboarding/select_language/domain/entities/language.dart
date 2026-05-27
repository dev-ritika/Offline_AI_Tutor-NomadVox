import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String langName;
  final String nativeName;
  final String langCode;
  final String speakers;

  const Language({
    required this.langCode,
    required this.langName,
    required this.nativeName,
    required this.speakers,
  });

  @override
  List<Object?> get props => [langName, nativeName, langCode, speakers];

  Language copyWith({
    String? langName,
    String? nativeName,
    String? langCode,
    String? speakers,
  }) {
    return Language(
      langCode: langCode ?? this.langCode,
      langName: langName ?? this.langName,
      nativeName: nativeName ?? this.nativeName,
      speakers: speakers ?? this.speakers,
    );
  }
}
