import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/get_languages.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';

@injectable
class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  final GetLanguages getLanguages;

  LanguagesBloc({required this.getLanguages}) : super(const LanguagesEmpty()) {
    on<LanguagesScreenLoads>(_onLanguagesScreenLoads);
    on<SelectLanguage>(_selectLanguage);
  }

  void _selectLanguage(SelectLanguage event, Emitter<LanguagesState> emit) {
    if (state case final LanguagesLoaded s) {
      final isToggleOff =
          s.selectedLanguage?.langCode == event.selectedLanguage?.langCode;
      emit(
        s.copyWith(
          selected: isToggleOff ? null : event.selectedLanguage,
          clearSelected: isToggleOff,
        ),
      );
    }
  }

  Future<void> _onLanguagesScreenLoads(
    LanguagesScreenLoads event,
    Emitter<LanguagesState> emit,
  ) async {
    emit(const LanguagesLoading());

    await Future.delayed(const Duration(seconds: 1));

    final Either<Failures, List<Language>> data = await getLanguages(
      const NoParams(),
    );

    data.fold(
      (l) {
        emit(LanguagesError(error: l));
      },
      (r) {
        emit(LanguagesLoaded(languagesList: r));
      },
    );
  }
}
