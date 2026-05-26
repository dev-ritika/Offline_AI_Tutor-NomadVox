// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/services.dart' as _i281;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:offline_ai_tutor/core/dependency_injection/register_module.dart'
    as _i989;
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
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i281.AssetBundle>(() => registerModule.assetBundle);
    gh.lazySingleton<_i869.LanguagesParser>(() => _i869.LanguagesParser());
    gh.lazySingleton<_i707.SaveLanguageLocallyDataSource>(
        () => _i707.SaveLanguageLocallyDataSourceImpl());
    gh.lazySingleton<_i156.LanguageLocalDataSource>(
        () => _i156.LanguageLocalDataSourceImpl(
              rootBundle: gh<_i281.AssetBundle>(),
              languagesParser: gh<_i869.LanguagesParser>(),
            ));
    gh.lazySingleton<_i356.SelectedLanguageRepository>(() =>
        _i230.SaveLanguageRepoImpl(
            saveLanguageLocallyDataSource:
                gh<_i707.SaveLanguageLocallyDataSource>()));
    gh.lazySingleton<_i97.SaveLanguage>(() => _i97.SaveLanguage(
        selectedLanguageRepository: gh<_i356.SelectedLanguageRepository>()));
    gh.lazySingleton<_i518.LanguageRepository>(() => _i163.LanguageRepoImpl(
        languageDataSource: gh<_i156.LanguageLocalDataSource>()));
    gh.lazySingleton<_i614.GetLanguages>(() =>
        _i614.GetLanguages(languageRepository: gh<_i518.LanguageRepository>()));
    gh.factory<_i620.LanguagesBloc>(() => _i620.LanguagesBloc(
          getLanguages: gh<_i614.GetLanguages>(),
          saveLanguage: gh<_i97.SaveLanguage>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i989.RegisterModule {}
