import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/llm_model.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/llm_model_repository.dart';

@lazySingleton
class GetModels {
  final LlmModelRepository llmModelRepository;

  GetModels({required this.llmModelRepository});

  Future<Either<Failures, LLMModelEntity>> call() async {
    return await llmModelRepository.getLLMModelsData();
  }
}
