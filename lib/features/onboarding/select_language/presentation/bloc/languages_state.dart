import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

sealed class LanguagesState extends Equatable {
  const LanguagesState();
}

class LanguagesLoadedState extends LanguagesState {
  final List<Language>? languagesList;

  const LanguagesLoadedState({this.languagesList});

  LanguagesLoadedState copyWith({List<Language>? languagesList}) {
    return LanguagesLoadedState(
      languagesList: languagesList ?? this.languagesList,
    );
  }

  @override
  List<Object?> get props => [languagesList];
}

class LanguagesLoadingState extends LanguagesState {
  const LanguagesLoadingState();
  @override
  List<Object?> get props => [];
}

class LanguagesErrorState extends LanguagesState {
  final String? errorMessage;
  const LanguagesErrorState({required this.errorMessage});

  LanguagesErrorState copyWith({String? errorMessage}) {
    return LanguagesErrorState(errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [errorMessage];
}

class LanguagesEmptyState extends LanguagesState {
  const LanguagesEmptyState();
  @override
  List<Object?> get props => [];
}
