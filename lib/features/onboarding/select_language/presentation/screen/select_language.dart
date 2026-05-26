import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/core/dependency_injection/dependency_injection.dart';
import 'package:offline_ai_tutor/core/utils/constants/color_consts.dart';
import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';
import 'package:offline_ai_tutor/core/utils/enums/state_enum.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/common_widgets/onboarding_header.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_bloc.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_event.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/bloc/languages_state.dart';
import 'package:offline_ai_tutor/features/onboarding/select_language/presentation/widgets/languages_buttons.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LanguagesBloc>()..add(LanguagesScreenLoads()),
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 25,
                ),
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
                    BlocSelector<
                      LanguagesBloc,
                      LanguagesLoaded,
                      ({bool hasSelection, StateStatusEnum? status})
                    >(
                      selector: (state) => (
                        hasSelection: state.hasSelection,
                        status: state.status,
                      ),
                      builder: (context, data) {
                        return PrimaryButton(
                          showLoader: data.status == StateStatusEnum.saving,
                          buttonText: StringConsts.continueText,
                          onTap: data.hasSelection
                              ? () {
                                  context.read<LanguagesBloc>().add(
                                    SaveSelectedLanguage(),
                                  );
                                }
                              : null,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          BlocSelector<LanguagesBloc, LanguagesLoaded, bool>(
            selector: (state) => state.isLoading ?? false,
            builder: (context, isLoading) => isLoading
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: ColorConsts.blackOverlay,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
