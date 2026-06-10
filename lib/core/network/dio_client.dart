import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/exceptions.dart';
import 'package:offline_ai_tutor/core/network/helpers/download_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class DioClient {
  late Dio dio;

  static final DioClient _instance = DioClient._internal();

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://dev-ritika.github.io/",
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        connectTimeout: const Duration(microseconds: 0),
        receiveTimeout: const Duration(microseconds: 0),
      ),
    );

    dio.interceptors.addAll([
      PrettyDioLogger(responseBody: true, requestBody: true),
    ]);
  }

  Future<Either<Exception, Response>> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final Response response = await dio.get(
        endpoint,
        queryParameters: queryParams,
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return right(response);
      }

      return left(
        NetworkException(message: "Server error - ${response.statusMessage}"),
      );
    } on DioException catch (e) {
      return left(NetworkException(message: "Network error - ${e.message}"));
    } catch (e) {
      return left(NetworkException(message: "Unknown error - ${e.toString()}"));
    }
  }

  Stream<Either<Exception, DownloadModel>> downloadFile({
    required String url,
    Map<String, dynamic>? queryParams,
  }) async* {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = url.split('/').last;
      final savePath = '${dir.path}/$fileName';

      final StreamController progressController = StreamController<int>();
      final Completer completer = Completer<Response>();

      int prevPercentage = 1;

      dio
          .download(
            url,
            savePath,

            onReceiveProgress: (count, total) {
              if (total > 0) {
                final percentage = ((count / total) * 100).round();

                if (percentage != prevPercentage) {
                  prevPercentage = percentage;
                  progressController.add(percentage);
                }
              }
            },
          )
          .then((result) {
            progressController.close();
            completer.complete(result);
          })
          .catchError((e) {
            progressController.close();
            completer.completeError(e);
          });

      await for (var percentage in progressController.stream) {
        yield right(DownloadModel(download: percentage));
      }

      final Response response = await completer.future;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        yield right(DownloadModel(download: 100, response: response));
      } else {
        yield left(
          NetworkException(message: "Server error - ${response.statusMessage}"),
        );
      }
    } on DioException catch (e) {
      yield left(NetworkException(message: "Network error - ${e.message}"));
    } catch (e) {
      yield left(NetworkException(message: "Unknown error - ${e.toString()}"));
    }
  }
}
