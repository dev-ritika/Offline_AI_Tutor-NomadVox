import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

final class LanguagesState extends Equatable {
  final Language? selectedLanguage;
  final List<Language> languagesList;
  final StateStatusEnum status;

  // final bool? isLoading;
  final Failures? error;

  const LanguagesState({
    this.status = StateStatusEnum.empty,
    this.error,
    // this.isLoading = false,
    this.languagesList = const [],
    this.selectedLanguage,
  });

  @override
  List<Object?> get props => [languagesList, selectedLanguage, status, error];

  bool get hasSelection => selectedLanguage != null;

  bool get isLoading => status == StateStatusEnum.loading;

  bool isSelected(Language l) {
    return l.langName == selectedLanguage?.langName;
  }

  LanguagesState copyWith({
    List<Language>? languagesList,
    Language? selected,
    bool clearSelected = false,
    StateStatusEnum? status,
    Failures? error,
    bool clearError = false,
  }) {
    var x = LanguagesState(
      status: status ?? this.status,
      error: clearError ? null : error ?? this.error,
      languagesList: languagesList ?? this.languagesList,
      selectedLanguage: clearSelected ? null : (selected ?? selectedLanguage),
    );
    return x;
  }
}
