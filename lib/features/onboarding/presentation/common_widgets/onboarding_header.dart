import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final int stepNum;

  const OnboardingHeader({super.key, required this.stepNum});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "STEP $stepNum OF 3",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 8),
        Text(
          "Choose a language",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8),
        Text(
          "You can add more later",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 18),
      ],
    );
  }
}
