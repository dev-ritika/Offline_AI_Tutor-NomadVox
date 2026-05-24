import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

abstract class LanguagesEvent extends Equatable {
  const LanguagesEvent();

  @override
  List<Object?> get props => [];
}

class LanguagesScreenLoads extends LanguagesEvent {}

class SelectLanguage extends LanguagesEvent {
  final Language? selectedLanguage;

  const SelectLanguage({this.selectedLanguage});

  @override
  List<Object?> get props => [selectedLanguage];
}
