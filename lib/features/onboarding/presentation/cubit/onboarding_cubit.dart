import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_languages.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_levels.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/onboarding_header_enum.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final GetLanguages getLanguages;
  final GetLevels getLevels;
  OnboardingCubit({required this.getLanguages, required this.getLevels})
    : super(const OnboardingState.initialState());

  void loadNextContent() async {
    emit(state.copyWith(currentStep: state.currentStep.nextStep));

    switch (state.currentStep.currentStep) {
      // case (1):
      // emit(state.copyWith(currentStep: OnboardingStepEnum.language));
      case (2):
        print("object 1");
        loadLevels();
        emit(state.copyWith(currentStep: OnboardingStepEnum.level));
      //  case (3):
      //  emit(state.copyWith(currentStep: OnboardingStepEnum.name));
    }
  }

  Future<void> onLanguagesLoads() async {
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
        emit(state.copyWith(languagesList: r, status: StateStatusEnum.loaded));
      },
    );
  }

  void selectLanguage(Language? selectedLanguage) {
    bool isAlreadySelected =
        state.selectedLanguage?.langCode == selectedLanguage?.langCode;

    print(isAlreadySelected);

    emit(
      state.copyWith(
        clearLanguageSelection: isAlreadySelected,
        selectedLanguage: selectedLanguage,
        status: StateStatusEnum.loaded,
      ),
    );
  }

  void loadLevels() async {
    print("object");
    final Either<Failures, List<Level>> data = await getLevels();

    data.fold((l) {}, (list) {
      emit(state.copyWith(levelsList: list));
    });
  }

  void selectLevel(Level? selectedLevel) {
    bool alreadySelected = state.selectedLevel?.title == selectedLevel?.title;

    emit(
      state.copyWith(
        selectedLevel: selectedLevel,
        clearLevelSelection: alreadySelected,
      ),
    );
  }

  void enterName(String? username) {
    emit(state.copyWith(enteredName: username));
  }

  //  Future<void> _saveSelectedLanguage(
  //   LanguageSaved event,
  //   Emitter<LanguagesState> emit,
  // ) async {
  //   if (state.selectedLanguage == null) return;

  //   emit(state.copyWith(status: StateStatusEnum.saving));

  //   final Either<Failures, void> data = await saveLanguage.call(
  //     state.selectedLanguage!,
  //   );

  //   data.fold(
  //     (l) {
  //       emit(state.copyWith(error: l, status: StateStatusEnum.error));
  //     },
  //     (r) {
  //       //later code to add navigation
  //       emit(state.copyWith(status: StateStatusEnum.saved));
  //     },
  //   );
  // }
}
