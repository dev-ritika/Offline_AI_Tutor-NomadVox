import 'package:offline_ai_tutor/features/onboarding/select_level/domain/entities/level.dart';

class LevelDataModel {
  final String title;
  final String subTitle;

  LevelDataModel({required this.title, required this.subTitle});

  Level toDomain() {
    return Level(title: title, subTitle: subTitle);
  }

  static List<LevelDataModel> getList() {
    return [
      LevelDataModel(
        title: "A1 · Absolute Beginner",
        subTitle: "No knowledge at all",
      ),
      LevelDataModel(
        title: "A2 · Elementary",
        subTitle: "Basic greetings, simple sentences",
      ),
      LevelDataModel(
        title: "B1 · Intermediate",
        subTitle: "Can handle most travel situations",
      ),
      LevelDataModel(
        title: "B2 · Upper Intermediate",
        subTitle: "Fluent in most topics",
      ),
      LevelDataModel(
        title: "C1 - C2 · Advanced",
        subTitle: "Near-native, fine-tuning only",
      ),
    ];
  }
}
