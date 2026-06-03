import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:offline_ai_tutor/core/storage/hive/hive_type_ids.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/level.dart';
part 'level_data_model.g.dart';

@HiveType(typeId: HiveTypeIds.levelModelId)
class LevelDataModel {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String subTitle;

  const LevelDataModel({
    required this.code,
    required this.title,
    required this.subTitle,
  });

  Level toDomain() {
    return Level(title: title, subTitle: subTitle, code: code);
  }

  factory LevelDataModel.fromDomain(Level data) {
    return LevelDataModel(
      code: data.code,
      title: data.title,
      subTitle: data.subTitle,
    );
  }

  static const List<LevelDataModel> getList = [
    LevelDataModel(
      code: "A1",
      title: "A1 · Absolute Beginner",
      subTitle: "No knowledge at all",
    ),
    LevelDataModel(
      code: "A2",
      title: "A2 · Elementary",
      subTitle: "Basic greetings, simple sentences",
    ),
    LevelDataModel(
      code: "B1",
      title: "B1 · Intermediate",
      subTitle: "Can handle most travel situations",
    ),
    LevelDataModel(
      code: "B2",
      title: "B2 · Upper Intermediate",
      subTitle: "Fluent in most topics",
    ),
    LevelDataModel(
      code: "C1 - C2",
      title: "C1 - C2 · Advanced",
      subTitle: "Near-native, fine-tuning only",
    ),
  ];
}
