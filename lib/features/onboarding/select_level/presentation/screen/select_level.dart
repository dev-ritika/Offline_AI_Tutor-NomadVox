import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/common_widgets/onboarding_header.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 25),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    OnboardingHeader(
                      currentStep: 2,
                      totalStep: 3,
                      title: StringConsts.stepTitle,
                      subtitle: StringConsts.stepSubTitle,
                    ),
                  ],
                ),
              ),

              PrimaryButton(buttonText: StringConsts.continueText, onTap: null),
            ],
          ),
        ),
      ),
    );
  }
}
