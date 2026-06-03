// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/services.dart' as _i281;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_ce/hive.dart' as _i738;
import 'package:hive_ce/hive_ce.dart' as _i1055;
import 'package:injectable/injectable.dart' as _i526;
import 'package:offline_ai_tutor/core/dependency_injection/register_module.dart'
    as _i989;
import 'package:offline_ai_tutor/core/storage/hive/hive_boxes_module.dart'
    as _i998;
import 'package:offline_ai_tutor/core/storage/hive/hive_initializer.dart'
    as _i314;
import 'package:offline_ai_tutor/features/onboarding/data/data_model/user_data_model.dart'
    as _i702;
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/language_local_data_source.dart'
    as _i547;
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/languages_parser.dart'
    as _i718;
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/level_local_data_source.dart'
    as _i510;
import 'package:offline_ai_tutor/features/onboarding/data/data_sources/save_user_data_source.dart'
    as _i463;
import 'package:offline_ai_tutor/features/onboarding/data/repositories/language_repo_impl.dart'
    as _i590;
import 'package:offline_ai_tutor/features/onboarding/data/repositories/level_repository_impl.dart'
    as _i990;
import 'package:offline_ai_tutor/features/onboarding/data/repositories/save_user_data_repo_impl.dart'
    as _i974;
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/language_repo.dart'
    as _i837;
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/level_repository.dart'
    as _i984;
import 'package:offline_ai_tutor/features/onboarding/domain/repositories/save_user_data_repo.dart'
    as _i386;
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_languages.dart'
    as _i925;
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/get_levels.dart'
    as _i1031;
import 'package:offline_ai_tutor/features/onboarding/domain/use_cases/save_user_data.dart'
    as _i1042;
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart'
    as _i960;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final hiveBoxesModule = _$HiveBoxesModule();
    gh.lazySingleton<_i281.AssetBundle>(() => registerModule.assetBundle);
    gh.lazySingleton<_i718.LanguagesParser>(() => _i718.LanguagesParser());
    gh.lazySingleton<_i314.HiveInitializer>(() => _i314.HiveInitializerImpl());
    gh.lazySingleton<_i510.LevelLocalDataSource>(
      () => const _i510.LevelLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i738.Box<_i702.UserDataModel>>(
      () => hiveBoxesModule.getUserPrefBox,
      instanceName: 'userPrefs',
    );
    gh.lazySingleton<_i463.SaveUserDataLocallyDataSource>(
      () => _i463.SaveUserDataLocallyDataSourceImpl(
        gh<_i1055.Box<_i702.UserDataModel>>(instanceName: 'userPrefs'),
      ),
    );
    gh.lazySingleton<_i386.SaveUserDataRepo>(
      () => _i974.SaveUserDataRepoImpl(
        saveUserDataLocallyDataSource:
            gh<_i463.SaveUserDataLocallyDataSource>(),
      ),
    );
    gh.lazySingleton<_i547.LanguageLocalDataSource>(
      () => _i547.LanguageLocalDataSourceImpl(
        rootBundle: gh<_i281.AssetBundle>(),
        languagesParser: gh<_i718.LanguagesParser>(),
      ),
    );
    gh.lazySingleton<_i1042.SaveUserData>(
      () => _i1042.SaveUserData(saveUserDataRepo: gh<_i386.SaveUserDataRepo>()),
    );
    gh.lazySingleton<_i984.LevelRepository>(
      () => _i990.LevelRepositoryImpl(gh<_i510.LevelLocalDataSource>()),
    );
    gh.lazySingleton<_i837.LanguageRepository>(
      () => _i590.LanguageRepoImpl(
        languageDataSource: gh<_i547.LanguageLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i1031.GetLevels>(
      () => _i1031.GetLevels(gh<_i984.LevelRepository>()),
    );
    gh.lazySingleton<_i925.GetLanguages>(
      () => _i925.GetLanguages(
        languageRepository: gh<_i837.LanguageRepository>(),
      ),
    );
    gh.factory<_i960.OnboardingCubit>(
      () => _i960.OnboardingCubit(
        saveUserData: gh<_i1042.SaveUserData>(),
        getLanguages: gh<_i925.GetLanguages>(),
        getLevels: gh<_i1031.GetLevels>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i989.RegisterModule {}

class _$HiveBoxesModule extends _i998.HiveBoxesModule {}
