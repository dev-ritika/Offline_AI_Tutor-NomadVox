import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/common_widgets/onboarding_header.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/language_local_ds.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/repositories/language_repo_impl.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/get_user.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/widgets/languages_buttons.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var x = LanguageLocalDS().fetchLanguages();
    print(x);

    return BlocProvider(
      create: (context) => LanguagesBloc(
        getUser: GetUser(
          languageRepo: LanguageRepoImpl(langDS: LanguageLocalDS()),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnboardingHeader(stepNum: 1),
                      LanguagesButtons(),
                    ],
                  ),
                ),
                PrimaryButton(
                  buttonText: "Continue",
                  onTap: () => print("object"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
