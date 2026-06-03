import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_ai_tutor/core/dependency_injection/dependency_injection.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/onboarding_action.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:offline_ai_tutor/features/onboarding/presentation/widgets/onboarding_loader.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //TO DO ADD VIA DEPENDENCY INJECTION
      create: (context) => sl<OnboardingCubit>(),
      // OnboardingCubit(getLanguages: sl(), getLevels: sl())
      //   ..onLanguagesLoads(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                print("object");
              },
              child: Scaffold(
                body: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 25,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              //header
                              const OnboardingHeader(),
                              //content
                              Expanded(
                                child: OnboardingContent(
                                  pageController: pageController,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //button
                        const OnboardingAction(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //loader
            const OnboardingLoader(),
          ],
        ),
      ),
    );
  }
}
