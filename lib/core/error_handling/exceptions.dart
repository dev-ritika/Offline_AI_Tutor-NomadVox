class LanguageDataException implements Exception {
  final String message;

  LanguageDataException({required this.message});

  @override
  String toString() => message;
}

class HiveDataException implements Exception {
  final String message;

  HiveDataException({required this.message});

  @override
  String toString() => message;
}
