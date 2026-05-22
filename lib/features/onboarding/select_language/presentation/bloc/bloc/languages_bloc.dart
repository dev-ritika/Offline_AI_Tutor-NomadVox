import 'package:bloc/bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/get_user.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/bloc/languages_state.dart';

class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
  final GetUser getUser;

  LanguagesBloc({required this.getUser}) : super(LanguagesState()) {
    on<LanguagesScreenLoads>(_onLanguagesScreenLoads);
  }

  void _onLanguagesScreenLoads(LanguagesEvent event, Emitter emit) async {
    try {
      final List<Language> languagesList = await getUser();

      emit(
        state.copyWith(
          languagesList: [...?state.languagesList, ...languagesList],
        ),
      );
    } catch (e) {
      // to do : what will be the right approach to show snackbar in ui
      print("error occured");
    }
  }
}
