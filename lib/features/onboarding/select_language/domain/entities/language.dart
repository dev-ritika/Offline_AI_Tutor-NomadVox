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
    bool? isSelected,
  }) {
    return Language(
      langCode: langCode ?? this.langCode,
      langName: langName ?? this.langName,
      nativeName: nativeName ?? this.nativeName,
      speakers: speakers ?? this.speakers,
    );
  }

  bool operator ==(Object object) {
    if (identical(object, this)) {
      return true;
    } else {
      return object is Language &&
          this.langCode == object.langCode &&
          this.langName == object.langName &&
          this.nativeName == object.nativeName &&
          this.speakers == object.speakers;
    }
  }

  @override
  int get hashCode =>
      langCode.hashCode ^
      langName.hashCode ^
      nativeName.hashCode ^
      speakers.hashCode;
}
