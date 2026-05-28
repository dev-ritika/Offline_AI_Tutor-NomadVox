import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/usecases/get_levels.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/presentation/cubit/levels_state.dart';

@injectable
class LevelsCubit extends Cubit<LevelsState> {
  final GetLevels getLevels;

  LevelsCubit(this.getLevels) : super(const LevelsState());

  void loadLevels() async {
    final Either<Failures, List<Level>> data = await getLevels();

    data.fold((l) {}, (list) {
      emit(LevelsState(levelsList: list));
    });
  }

  void selectLevel(Level? selectedLevel) {
    bool alreadySelected = state.selectedLevel?.title == selectedLevel?.title;

    emit(
      state.copyWith(
        selectedLevel: selectedLevel,
        clearSelection: alreadySelected,
      ),
    );
  }
}
