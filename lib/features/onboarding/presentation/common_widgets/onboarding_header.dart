import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';

class OnboardingHeader extends StatelessWidget {
  final int currentStep;
  final int totalStep;
  final String title;
  final String subtitle;

  const OnboardingHeader({
    super.key,
    required this.currentStep,
    required this.totalStep,
    required this.title,
    required this.subtitle,
  }) : assert(currentStep <= totalStep);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConsts.stepText(currentStep, totalStep),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 18),
      ],
    );
  }
}
