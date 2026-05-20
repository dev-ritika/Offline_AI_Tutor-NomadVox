import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/utils/constants/string_consts.dart';

class SplashText extends StatelessWidget {
  const SplashText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      StringConsts.splashSubText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
