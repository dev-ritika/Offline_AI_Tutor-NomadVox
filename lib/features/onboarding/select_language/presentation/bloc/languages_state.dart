import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';

sealed class LanguagesState extends Equatable {
  const LanguagesState();
}

final class LanguagesLoaded extends LanguagesState {
  final List<Language> languagesList;

  const LanguagesLoaded({this.languagesList = const []});

  /// not required
  /// also this will not allow to clear the values
  //LanguagesLoadedState copyWith({List<Language>? languagesList}) {
  //   return LanguagesLoadedState(
  //     languagesList: languagesList ?? this.languagesList,
  //   );
  // }

  @override
  List<Object?> get props => [languagesList];
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
