import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';

class LanguagesButtons extends StatefulWidget {
  const LanguagesButtons({super.key});

  @override
  State<LanguagesButtons> createState() => _LanguagesButtonsState();
}

class _LanguagesButtonsState extends State<LanguagesButtons> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LanguagesBloc>().add(LanguagesScreenLoads());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LanguagesBloc, LanguagesState>(
      listener: (context, state) {
        if (state is LanguagesErrorState) {
          Fluttertoast.showToast(msg: state.errorMessage ?? "");
        }
      },
      child: BlocSelector<LanguagesBloc, LanguagesState, List<Language>?>(
        selector: (state) {
          return switch (state) {
            LanguagesLoadedState(:final languagesList) => languagesList,
            _ => null,
          };
        },
        builder: (context, languagesList) {
          return Expanded(
            child: ListView.builder(
              itemCount: languagesList?.length ?? 0,
              itemBuilder: (context, index) {
                return SelectableContainer(
                  leadingItem: CountryFlag.fromLanguageCode(
                    languagesList?[index].langCode ?? "en",
                    theme: const ImageTheme(
                      // shape: Circle(),
                      height: 30,
                      width: 40,
                    ),
                  ),
                  isSelected: false,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
