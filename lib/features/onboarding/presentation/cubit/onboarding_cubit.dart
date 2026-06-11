import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
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
import 'package:offline_ai_tutor/features/onboarding/presentation/utils/enums/onboarding_header_enum.dart';
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

  bool installationStarted = false;
  void goNext() {
    final next = state.currentStep.next;

    if (next == OnboardingStepEnum.models && !installationStarted) {
      installationStarted = true;
      downloadModel();
    }

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

    final Either<Failures, List<Language>> data = await getLanguages();

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
    final Either<Failures, List<Level>> data = await getLevels();

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
    final data = await getModels.call();

    data.fold(
      (l) => emit(state.copyWith(error: l, status: StateStatusEnum.error)),
      (r) {
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
      },
    );
  }

  int index = 0;
  int voicesIndex = 0;
  bool downloadingOnnx = true; // true = onnx file, false = config file
  int completedBytes = 0; // bytes from files already finished (index == 1)
  int totalBytes = 0; // sum of all onnx+config across the 5 voices

  Future<void> downloadModel() async {
    final Models downloadableModel = state.modelsData!.models[index];
    late final String url;

    if (downloadableModel.id == "tts") {
      totalBytes = state.modelsData!.models[index].sizeBytes;
      final voice = downloadableModel.voices![voicesIndex];
      if (downloadingOnnx) {
        print("downloading onnx file (voice $voicesIndex)");
        url = voice.onnx;
      } else {
        print("downloading config file (voice $voicesIndex)");
        url = voice.config;
      }
    } else {
      url = downloadableModel.url ?? "";
    }

    final response = installModel.call(url);

    // size in bytes of the file currently downloading (index == 1 only)
    int currentFileBytes = 0;
    if (downloadableModel.id == "tts") {
      final voice = downloadableModel.voices![voicesIndex];
      currentFileBytes = downloadingOnnx
          ? voice.onnxSizeBytes
          : voice.configSizeBytes;
    }

    await for (var result in response) {
      result.fold(
        (l) {
          emit(state.copyWith(error: l, status: StateStatusEnum.error));
        },
        (r) {
          late final ModelInstallData? installedModel;

          if (index == 1) {
            // r.download is cumulative percent (0..100) of THIS file.
            // overall = (bytes finished before + bytes finished now) / total
            final int doneBytesNow =
                completedBytes +
                (currentFileBytes * (r.download / 100)).round();
            final int percent = (doneBytesNow / totalBytes * 100)
                .clamp(0, 100)
                .round();

            installedModel = state.modelInstallData?[index].copyWith(
              id: downloadableModel.id,
              index: index,
              installedPercentage: percent,
              installedStatus: percent < 100
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

          final List<ModelInstallData> currentList = [
            ...state.modelInstallData!,
          ];
          currentList[index] = installedModel!;
          emit(state.copyWith(modelInstallData: [...currentList]));
        },
      );
    }

    // current file finished -> bank its bytes so the next file continues from here
    if (downloadableModel.id == "tts") {
      completedBytes += currentFileBytes;

      if (downloadingOnnx) {
        // onnx done -> download config for the SAME voice
        downloadingOnnx = false;
        downloadModel();
      } else {
        // config done -> this voice is fully finished
        downloadingOnnx = true;
        if (voicesIndex >= (downloadableModel.voices?.length ?? 0) - 1) {
          emit(state.copyWith(installedAllModels: true));
          // index++; // uncomment if you want to continue to the next model
        } else {
          voicesIndex++;
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
