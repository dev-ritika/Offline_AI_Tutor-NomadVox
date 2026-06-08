import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/core/use_case/usecase.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/entities/llm_model.dart';
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/llm_model_repository.dart';

@lazySingleton
class GetModels implements Usecase<LLMModelEntity, NoParams> {
  final LlmModelRepository llmModelRepository;

  GetModels({required this.llmModelRepository});

  @override
  Future<Either<Failures, LLMModelEntity>> call(x) async {
    return await llmModelRepository.getLLMModelsData();
  }
}
