import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/llm_model.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/user_data.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_languages.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_levels.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_models.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/install_model.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/save_user_data.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/enums/model_install_status_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/helper_classes/model_install_data.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final GetLanguages getLanguages;
  final GetLevels getLevels;
  final SaveUserData saveUserData;
  final GetModels getModels;
  final InstallModel installModel;

  OnboardingCubit({
    required this.saveUserData,
    required this.getLanguages,
    required this.getLevels,
    required this.getModels,
    required this.installModel,
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

      List<ModelInstallData> modelInstallData = [];
      int index = 0;

      for (var x in r.models) {
        modelInstallData.add(
          ModelInstallData(
            id: x.id,
            index: index,
            installedPercentage: 0,
            installedStatus: ModelInstallStatusEnum.Queued,
            name: x.displayName,
          ),
        );
        index++;
      }

      emit(state.copyWith(modelInstallData: modelInstallData));
    });
  }

  int index = 0;
  int index2 = 0;
  bool installedFirstFile = false;
  int downloadPercentage = 0;

  Future<void> downloadModel() async {
    final Models downloadableModel = state.modelsData!.models[index];
    late final String url;

    //changed
    if (index == 1) {
      if (!installedFirstFile) {
        print("downloading first file");
        url = downloadableModel.voices![index2].onnx;
        installedFirstFile = true;
      } else if (installedFirstFile) {
        print("downloading second file");
        url = downloadableModel.voices![index2].config;
        installedFirstFile = false;
      }
    } else {
      url = downloadableModel.url ?? "";
    }

    final response = installModel.call(url);

    await for (var result in response) {
      result.fold((l) => print(l.toString()), (r) {
        late final ModelInstallData? installedModel;

        //changed
        if (index == 1) {
          if (!installedFirstFile) {
            downloadPercentage +=
                (downloadableModel.voices![index2].onnxSizeBytes /
                        state.modelsData!.models[index].sizeBytes *
                        r.download)
                    .round();
          } else {
            downloadPercentage +=
                (downloadableModel.voices![index2].configSizeBytes /
                        state.modelsData!.models[index].sizeBytes *
                        r.download)
                    .round();
          }

          installedModel = state.modelInstallData?[index].copyWith(
            id: downloadableModel.id,
            index: index,
            installedPercentage: downloadPercentage,
            installedStatus: downloadPercentage <= 100
                ? ModelInstallStatusEnum.Downloading
                : ModelInstallStatusEnum.Downloaded,
            name: downloadableModel.displayName,
          );
        } else {
          installedModel = state.modelInstallData?[index].copyWith(
            id: downloadableModel.id,
            index: index,
            installedPercentage: r.download,
            installedStatus: r.download < 100
                ? ModelInstallStatusEnum.Downloading
                : ModelInstallStatusEnum.Downloaded,
            name: downloadableModel.displayName,
          );
        }

        final List<ModelInstallData> currentList = [...state.modelInstallData!];
        currentList[index] = installedModel!;

        emit(state.copyWith(modelInstallData: [...currentList]));
      });
    }

    //changed
    if (index == 1) {
      if (installedFirstFile) {
        downloadModel();
      } else {
        if (index2 >= 4) {
          print("am i here");
          emit(state.copyWith(installedAllModels: true));

          //index++;
        } else {
          print("or hereeee");
          index2++;

          downloadModel();
        }
      }
    } else if (index < state.modelsData!.models.length &&
        state.modelInstallData?[index].installedStatus ==
            ModelInstallStatusEnum.Downloaded) {
      index++;
      downloadModel();
    }
  }
}
