import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
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
    : super(const LanguagesState()) {
    on<LanguagesScreenOpened>(_onLanguagesScreenLoads);
    on<LanguageSelected>(_selectLanguage);
    on<LanguageSaved>(_saveSelectedLanguage);
  }

  Future<void> _saveSelectedLanguage(
    LanguageSaved event,
    Emitter<LanguagesState> emit,
  ) async {
    if (state.selectedLanguage == null) return;

    emit(state.copyWith(status: StateStatusEnum.saving));

    final Either<Failures, void> data = await saveLanguage.call(
      state.selectedLanguage!,
    );

    data.fold(
      (l) {
        emit(state.copyWith(error: l, status: StateStatusEnum.error));
      },
      (r) {
        //later code to add navigation
        emit(state.copyWith(status: StateStatusEnum.saved));
      },
    );
  }

  void _selectLanguage(LanguageSelected event, Emitter<LanguagesState> emit) {
    bool isAlreadySelected =
        state.selectedLanguage?.langCode == event.selectedLanguage?.langCode;

    emit(
      state.copyWith(
        clearError: true,
        clearSelected: isAlreadySelected,
        selected: event.selectedLanguage,
        status: StateStatusEnum.loaded,
      ),
    );
  }

  Future<void> _onLanguagesScreenLoads(
    LanguagesScreenOpened event,
    Emitter<LanguagesState> emit,
  ) async {
    emit(state.copyWith(status: StateStatusEnum.loading));

    await Future.delayed(const Duration(seconds: 1));

    final Either<Failures, List<Language>> data = await getLanguages(
      const NoParams(),
    );

    data.fold(
      (l) {
        emit(state.copyWith(error: l, status: StateStatusEnum.error));
      },
      (r) {
        emit(LanguagesState(languagesList: r, status: StateStatusEnum.loaded));
      },
    );
  }
}
