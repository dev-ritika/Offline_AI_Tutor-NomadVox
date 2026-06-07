import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/network/dio_client.dart';
import 'package:offline_ai_tutor/features/onboarding/data/data_model/llm_model.dart';

abstract interface class LLMModelDataSource {
  Future<Either<Failures, LlmModel>> fetchModelsData();
}

@LazySingleton(as: LLMModelDataSource)
class LLMModelDataSourceImpl implements LLMModelDataSource {
  final DioClient dioClient;

  LLMModelDataSourceImpl({required this.dioClient});

  @override
  Future<Either<Failures, LlmModel>> fetchModelsData() async {
    final Either<Exception, Response> response = await dioClient.getRequest(
      endpoint: "model-manifest/manifest.json",
    );

    return response.fold(
      (l) {
        return left(NetworkFailure(l.toString()));
      },
      (r) {
        final LlmModel llmModel = LlmModel.fromJson(r.data);
        return right(llmModel);
      },
    );
  }
}
