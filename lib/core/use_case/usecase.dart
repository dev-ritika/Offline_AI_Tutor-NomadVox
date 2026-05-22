import 'package:dartz/dartz.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';

abstract interface class Usecase<Out, In> {
  Future<Either<Failures, Out>> call(In params);
}
