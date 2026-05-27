class StringConsts {
  StringConsts._();

  //splash screen
  static const String splashSubText =
      "Your private tutor \n learn as you travel...";

  //onboarding text
  static String stepText(int currentStep, int totalStep) {
    return "STEP $currentStep OF $totalStep";
  }

  static const String stepTitle = "Choose a language";
  static const String stepSubTitle = "You can change later";

  static const String levelTitle = "What's your level ?";
  static const String levelSubTitle = "Your tutor adapts based on your answer";

  //common
  static const String continueText = "Continue";
}
