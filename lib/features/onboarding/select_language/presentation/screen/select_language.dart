import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/common_widgets/onboarding_header.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/data_sources/language_local_data_source.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/data/repositories/language_repo_impl.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/domain/use_cases/get_languages.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/widgets/languages_buttons.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguagesBloc(
        getLanguages: GetLanguages(
          languageRepository: LanguageRepoImpl(
            languageDataSource: LanguageLocalDataSourceImpl(
              rootBundle: rootBundle,
            ),
          ),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
            child: Column(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnboardingHeader(
                        currentStep: 1,
                        totalStep: 3,
                        title: StringConsts.stepTitle,
                        subtitle: StringConsts.stepSubTitle,
                      ),
                      LanguagesButtons(),
                    ],
                  ),
                ),
                PrimaryButton(
                  buttonText: StringConsts.continueText,
                  onTap: () => debugPrint("object"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
