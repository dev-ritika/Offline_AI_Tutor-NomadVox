import 'package:equatable/equatable.dart';
import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';

class LevelsState extends Equatable {
  final List<Level>? levelsList;
  final Level? selectedLevel;

  const LevelsState({this.levelsList, this.selectedLevel});

  @override
  List<Object?> get props => [levelsList, selectedLevel];

  bool get isSelected => selectedLevel != null;

  LevelsState copyWith({
    List<Level>? levelsList,
    Level? selectedLevel,
    bool clearSelection = false,
  }) {
    return LevelsState(
      levelsList: levelsList ?? this.levelsList,
      selectedLevel: clearSelection
          ? null
          : selectedLevel ?? this.selectedLevel,
    );
  }
}
