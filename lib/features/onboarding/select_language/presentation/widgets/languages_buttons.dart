import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';

import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';

class LanguagesButtons extends StatelessWidget {
  const LanguagesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          BlocSelector<
            LanguagesBloc,
            LanguagesState,
            ({List<Language>? list, Language? selectedLanguage})
          >(
            selector: (state) => (
              list: state.languagesList,
              selectedLanguage: state.selectedLanguage,
            ),

            builder: (context, data) {
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: data.list?.length ?? 0,
                itemBuilder: (context, index) {
                  final listData = data.list?[index];
                  return SelectableContainer(
                    onTap: () {
                      context.read<LanguagesBloc>().add(
                        LanguageSelected(selectedLanguage: listData),
                      );
                    },
                    title: listData!.langName,
                    subtitle: "${listData.nativeName} | ${listData.speakers}",
                    leadingItem: CountryFlag.fromLanguageCode(
                      listData.langCode,
                      theme: const ImageTheme(
                        // shape: Circle(),
                        height: 30,
                        width: 40,
                      ),
                    ),

                    isSelected:
                        data.selectedLanguage?.langCode == listData.langCode,
                  );
                },
              );
            },
          ),
    );
  }
}
