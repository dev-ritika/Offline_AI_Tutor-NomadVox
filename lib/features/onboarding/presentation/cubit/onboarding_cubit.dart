import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/user_data.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_languages.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_levels.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_models.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/save_user_data.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final GetLanguages getLanguages;
  final GetLevels getLevels;
  final SaveUserData saveUserData;
  final GetModels getModels;

  OnboardingCubit({
    required this.saveUserData,
    required this.getLanguages,
    required this.getLevels,
    required this.getModels,
  }) : super(const OnboardingState()) {
    loadLanguages();
    loadLevels();
    fetchModels();
  }

  Future<void> submit() async {
    emit(state.copyWith(status: StateStatusEnum.saving));

    final UserData userData = UserData(
      selectedLanguage: state.selectedLanguage!,
      selectedLevel: state.selectedLevel!,
      userName: state.enteredName ?? "",
    );

    final result = await saveUserData.call(userData);

    result.fold(
      (l) => emit(state.copyWith(status: StateStatusEnum.error)),
      (r) => emit(state.copyWith(status: StateStatusEnum.saved)),
    );
  }

  void goNext() {
    final next = state.currentStep.next;

    if (next == null) {
      submit();
      return;
    }

    emit(state.copyWith(currentStep: next));
  }

  void goBack() {
    final previous = state.currentStep.back;
    if (previous == null) {
      return;
    }

    emit(
      state.copyWith(
        currentStep: previous,
        status: StateStatusEnum.loaded,
        clearError: true,
      ),
    );
  }

  Future<void> loadLanguages() async {
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

    emit(
      state.copyWith(
        clearLanguageSelection: isAlreadySelected,
        selectedLanguage: selectedLanguage,
      ),
    );
  }

  void loadLevels() async {
    final Either<Failures, List<Level>> data = await getLevels(
      const NoParams(),
    );

    data.fold(
      (l) {
        emit(state.copyWith(error: l));
      },
      (list) {
        emit(state.copyWith(levelsList: list));
      },
    );
  }

  void selectLevel(Level? selectedLevel) {
    bool alreadySelected = state.selectedLevel == selectedLevel;

    emit(
      state.copyWith(
        selectedLevel: selectedLevel,
        clearLevelSelection: alreadySelected,
      ),
    );
  }

  void enterName(String? username) {
    emit(state.copyWith(enteredName: username?.trim()));
  }

  Future<void> fetchModels() async {
    final data = await getModels.call(const NoParams());

    data.fold((l) => state.copyWith(error: l, status: StateStatusEnum.error), (
      r,
    ) {
      emit(state.copyWith(modelsDataa: r));

      print("modelssssss ${state.modelsData}");
      print(r.models.first.displayName);
      print(r.models[2].displayName);
    });
  }
}
