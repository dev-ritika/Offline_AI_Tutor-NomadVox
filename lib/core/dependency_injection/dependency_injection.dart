import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/dependency_injection/dependency_injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependency() => sl.init();
