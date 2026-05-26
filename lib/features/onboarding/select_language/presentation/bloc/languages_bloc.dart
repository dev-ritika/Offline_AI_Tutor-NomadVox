import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/get_languages.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/save_language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';

@injectable
class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  final GetLanguages getLanguages;
  final SaveLanguage saveLanguage;

  LanguagesBloc({required this.getLanguages, required this.saveLanguage})
    : super(const LanguagesEmpty()) {
    on<LanguagesScreenLoads>(_onLanguagesScreenLoads);
    on<SelectLanguage>(_selectLanguage);
    on<SaveSelectedLanguage>(_saveSelectedLanguage);
  }

  Future<void> _saveSelectedLanguage(
    SaveSelectedLanguage event,
    Emitter<LanguagesState> emit,
  ) async {
    if (state case LanguagesLoaded currentState) {
      if (currentState.selectedLanguage == null) return;

      final Either<Failures, void> data = await saveLanguage.call(
        currentState.selectedLanguage!,
      );

      data.fold(
        (l) {
          print("am i here ${currentState.languagesList}");
          emit(LanguagesError(error: l));
          print("am i here 2 ${currentState.languagesList}");
        },
        (r) {
          //later code to add navigation
          print("success");
        },
      );
      print("am i here 3 ${currentState.languagesList}");
    }
  }

  void _selectLanguage(SelectLanguage event, Emitter<LanguagesState> emit) {
    if (state case final LanguagesLoaded currentState) {
      bool isAlreadySelected =
          currentState.selectedLanguage?.langCode ==
          event.selectedLanguage?.langCode;

      emit(
        currentState.copyWith(
          clearSelected: isAlreadySelected,
          selected: event.selectedLanguage,
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
