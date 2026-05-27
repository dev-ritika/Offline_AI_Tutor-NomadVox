import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

abstract class LanguagesEvent extends Equatable {
  const LanguagesEvent();

  @override
  List<Object?> get props => [];
}

class LanguagesScreenOpened extends LanguagesEvent {
  const LanguagesScreenOpened();
}

class LanguageSelected extends LanguagesEvent {
  final Language? selectedLanguage;

  const LanguageSelected({this.selectedLanguage});

  @override
  List<Object?> get props => [selectedLanguage];
}

class LanguageSaved extends LanguagesEvent {
  const LanguageSaved();
}
