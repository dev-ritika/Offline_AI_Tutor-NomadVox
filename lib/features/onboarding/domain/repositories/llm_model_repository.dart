import 'package:dartz/dartz.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/llm_model.dart';

abstract interface class LlmModelRepository {
  Future<Either<Failures, LLMModelEntity>> getLLMModelsData();
}
