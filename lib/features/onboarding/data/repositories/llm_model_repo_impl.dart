import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/llm_model.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/llm_model_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/llm_model.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/llm_model_repository.dart';

@LazySingleton(as: LlmModelRepository)
class LlmModelRepoImpl implements LlmModelRepository {
  final LLMModelDataSource llmMModelDataSource;

  const LlmModelRepoImpl({required this.llmMModelDataSource});

  @override
  Future<Either<Failures, LLMModelEntity>> getLLMModelsData() async {
    final Either<Failures, LlmModel> data = await llmMModelDataSource
        .fetchModelsData();

    return data.fold(
      (l) {
        return left(l);
      },
      (r) {
        return right(r.toDomain());
      },
    );
  }
}
