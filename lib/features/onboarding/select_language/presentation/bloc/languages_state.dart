import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

sealed class LanguagesState extends Equatable {
  const LanguagesState();
}

final class LanguagesLoaded extends LanguagesState {
  final Language? selectedLanguage;
  final List<Language> languagesList;

  const LanguagesLoaded({this.languagesList = const [], this.selectedLanguage});

  @override
  List<Object?> get props => [languagesList, selectedLanguage];

  bool get hasSelection => selectedLanguage != null;

  bool isSelected(Language l) {
    return l.langName == selectedLanguage?.langName;
  }

  LanguagesLoaded copyWith({
    List<Language>? languagesList,
    Language? selected,
    bool clearSelected = false,
  }) {
    var x = LanguagesLoaded(
      languagesList: languagesList ?? this.languagesList,
      selectedLanguage: clearSelected
          ? null
          : (selected ?? this.selectedLanguage),
    );

    return x;
  }
}

final class LanguagesLoading extends LanguagesState {
  const LanguagesLoading();
  @override
  List<Object?> get props => [];
}

final class LanguagesError extends LanguagesState {
  final Failures? error;
  const LanguagesError({required this.error});

  @override
  List<Object?> get props => [error];
}

final class LanguagesEmpty extends LanguagesState {
  const LanguagesEmpty();
  @override
  List<Object?> get props => [];
}
