class LanguageDataException implements Exception {
  final String message;

  LanguageDataException({required this.message});

  @override
  String toString() => message;
}
