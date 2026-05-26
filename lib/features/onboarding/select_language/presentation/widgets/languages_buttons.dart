import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';

class LanguagesButtons extends StatelessWidget {
  const LanguagesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocListener<LanguagesBloc, LanguagesState>(
        listener: (context, state) {
          if (state is LanguagesError) {
            Fluttertoast.showToast(
              msg: state.error?.message ?? "Error occured",
            );
          }
        },

        child: BlocSelector<LanguagesBloc, LanguagesState, LanguagesLoaded?>(
          selector: (state) {
            return switch (state) {
              LanguagesLoaded() => state,
              _ => null,
            };
          },

          builder: (context, languageState) {
            print("i am rebuilt ${languageState?.languagesList.length}");
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: languageState?.languagesList.length ?? 0,
              itemBuilder: (context, index) {
                return SelectableContainer(
                  onTap: () {
                    debugPrint("tapped");
                    context.read<LanguagesBloc>().add(
                      SelectLanguage(
                        selectedLanguage: languageState.languagesList[index],
                      ),
                    );
                  },
                  language: languageState!.languagesList[index].langName,
                  speakers: languageState.languagesList[index].speakers,
                  leadingItem: CountryFlag.fromLanguageCode(
                    languageState.languagesList[index].langCode,
                    theme: const ImageTheme(
                      // shape: Circle(),
                      height: 30,
                      width: 40,
                    ),
                  ),

                  isSelected: languageState.isSelected(
                    languageState.languagesList[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
