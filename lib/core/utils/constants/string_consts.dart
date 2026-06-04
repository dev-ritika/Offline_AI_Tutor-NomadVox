class StringConsts {
  StringConsts._();

  //splash screen
  static const String splashSubText =
      "Your private tutor \n learn as you travel...";

  //onboarding text
  static String stepText(int currentStep, int totalStep) {
    return "STEP $currentStep OF $totalStep";
  }

  static const String selectLanguageTitle = "Choose a language";
  static const String selectLanguageSubTitle = "You can change later";

  static const String selectLevelTitle = "What's your level ?";
  static const String selectLevelSubTitle =
      "Your tutor adapts based on your answer";

  static const String enterNameTitle = "What should we call you?";
  static const String enterNameSubTitle = "Let's make this personal.";

  static const String installModelsTitle = "Setting up your tutor";
  static const String installModelsSubTitle =
      "Downloading AI models once.\nAfter this, everything works offline.";

  //common
  static const String continueText = "Continue";
}
