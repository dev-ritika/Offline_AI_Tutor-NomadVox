class LanguageDm {
  final String langName;
  final String nativeName;
  final String langCode;
  final String speakers;

  LanguageDm({
    required this.langCode,
    required this.langName,
    required this.nativeName,
    required this.speakers,
  });

  factory LanguageDm.fromJson({required Map<String, dynamic> data}) {
    return LanguageDm(
      langCode: data['langCode'],
      langName: data['langName'],
      nativeName: data['nativeName'],
      speakers: data['speakers'],
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
}
