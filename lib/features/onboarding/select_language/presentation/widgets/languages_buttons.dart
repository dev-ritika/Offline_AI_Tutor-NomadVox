import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:offline_ai_tutor/config/routes/routes_names.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/core/error_handling/failures.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';

class LanguagesButtons extends StatelessWidget {
  const LanguagesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocListener<LanguagesBloc, LanguagesLoaded>(
        listenWhen: (previous, current) =>
            // previous.error != current.error &&
            current.status == StateStatusEnum.error ||
            current.status == StateStatusEnum.saved,

        listener: (context, state) {
          print("objecttt");
          if (state.error is AssetFailure) {
            Fluttertoast.showToast(
              msg: state.error?.message ?? "Error occured",
            );
          }
          if (state.status == StateStatusEnum.saved) {
            Navigator.of(context).pushNamed(RoutesNames.selectLevelScreen);
          }
        },

        child:
            BlocSelector<
              LanguagesBloc,
              LanguagesLoaded,
              ({List<Language>? list, Function(Language l) isSelected})
            >(
              selector: (state) =>
                  (list: state.languagesList, isSelected: state.isSelected),

              builder: (context, languageState) {
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: languageState.list?.length ?? 0,
                  itemBuilder: (context, index) {
                    return SelectableContainer(
                      onTap: () {
                        context.read<LanguagesBloc>().add(
                          SelectLanguage(
                            selectedLanguage: languageState.list?[index],
                          ),
                        );
                      },
                      language: languageState.list![index].langName,
                      speakers: languageState.list![index].speakers,
                      leadingItem: CountryFlag.fromLanguageCode(
                        languageState.list![index].langCode,
                        theme: const ImageTheme(
                          // shape: Circle(),
                          height: 30,
                          width: 40,
                        ),
                      ),

                      isSelected: languageState.isSelected(
                        languageState.list![index],
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
