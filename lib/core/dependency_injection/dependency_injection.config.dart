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
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_model/language_model.dart'
    as _i556;
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/language_local_data_source.dart'
    as _i156;
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/languages_parser.dart'
    as _i869;
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/save_language_data_source.dart'
    as _i707;
import 'package:offline_ai_tutor/features/onboarding/select_language/data/repositories/language_repo_impl.dart'
    as _i163;
import 'package:offline_ai_tutor/features/onboarding/select_language/data/repositories/save_language_repo_impl.dart'
    as _i230;
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/language_repo.dart'
    as _i518;
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/repositories/selected_language_repo.dart'
    as _i356;
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/get_languages.dart'
    as _i614;
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/save_language.dart'
    as _i97;
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_bloc.dart'
    as _i620;

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
    gh.lazySingleton<_i869.LanguagesParser>(() => _i869.LanguagesParser());
    gh.lazySingleton<_i314.HiveInitializer>(() => _i314.HiveInitializerImpl());
    gh.lazySingleton<_i738.Box<_i556.LanguageModel>>(
      () => hiveBoxesModule.getUserPrefBox,
      instanceName: 'userPrefs',
    );
    gh.lazySingleton<_i156.LanguageLocalDataSource>(
      () => _i156.LanguageLocalDataSourceImpl(
        rootBundle: gh<_i281.AssetBundle>(),
        languagesParser: gh<_i869.LanguagesParser>(),
      ),
    );
    gh.lazySingleton<_i518.LanguageRepository>(
      () => _i163.LanguageRepoImpl(
        languageDataSource: gh<_i156.LanguageLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i707.SaveLanguageLocallyDataSource>(
      () => _i707.SaveLanguageLocallyDataSourceImpl(
        gh<_i1055.Box<_i556.LanguageModel>>(instanceName: 'userPrefs'),
      ),
    );
    gh.lazySingleton<_i614.GetLanguages>(
      () => _i614.GetLanguages(
        languageRepository: gh<_i518.LanguageRepository>(),
      ),
    );
    gh.lazySingleton<_i356.SelectedLanguageRepository>(
      () => _i230.SaveLanguageRepoImpl(
        saveLanguageLocallyDataSource:
            gh<_i707.SaveLanguageLocallyDataSource>(),
      ),
    );
    gh.lazySingleton<_i97.SaveLanguage>(
      () => _i97.SaveLanguage(
        selectedLanguageRepository: gh<_i356.SelectedLanguageRepository>(),
      ),
    );
    gh.factory<_i620.LanguagesBloc>(
      () => _i620.LanguagesBloc(
        getLanguages: gh<_i614.GetLanguages>(),
        saveLanguage: gh<_i97.SaveLanguage>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i989.RegisterModule {}

class _$HiveBoxesModule extends _i998.HiveBoxesModule {}
