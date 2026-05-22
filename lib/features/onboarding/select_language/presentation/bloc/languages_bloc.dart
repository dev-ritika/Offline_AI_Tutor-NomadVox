import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/use_case/no_params.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/get_languages.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';

@injectable
class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  final GetLanguages getLanguages;

  LanguagesBloc({required this.getLanguages}) : super(const LanguagesEmpty()) {
    on<LanguagesScreenLoads>(_onLanguagesScreenLoads);
  }

  Future<void> _onLanguagesScreenLoads(
    LanguagesScreenLoads event,
    Emitter<LanguagesState> emit,
  ) async {
    emit(const LanguagesLoading());

    await Future.delayed(const Duration(seconds: 1));

    final Either<Failures, List<Language>> data = await getLanguages(
      NoParams(),
    );

    data.fold(
      (l) {
        emit(LanguagesError(error: l));
      },
      (r) {
        emit(LanguagesLoaded(languagesList: r));
      },
    );
  }
}
