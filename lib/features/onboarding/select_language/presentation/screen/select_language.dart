import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/common_widgets/primary_button.dart';
import 'package:offline_ai_tutor/core/common_widgets/selectable_container.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/common_widgets/onboarding_header.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.only(bottom: 20),
      //   child: PrimaryButton(buttonText: "Continue"),
      // ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnboardingHeader(stepNum: 1),
                      SelectableContainer(isSelected: false),
                    ],
                  ),
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
    );
  }
}
