import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/entities/language_model.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/bloc/languages_state.dart';

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
    return BlocSelector<LanguagesBloc, LanguagesState, List<LanguageModel>?>(
      selector: (state) => state.languagesList,
      builder: (context, languagesList) {
        print("my list length ${languagesList?.length}");

        return Expanded(
          child: ListView.builder(
            itemCount: languagesList?.length ?? 0,
            itemBuilder: (context, index) {
              print("this is the index ${index}");
              return SelectableContainer(
                leadingItem: CountryFlag.fromLanguageCode(
                  languagesList?[index].langCode ?? "en",
                  theme: ImageTheme(
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
    );
  }
}
