import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final PageController pageController;
  const OnboardingContent({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          child: ElevatedButton(
            onPressed: () {
              pageController.nextPage(
                duration: Duration(milliseconds: 1),
                curve: Curves.easeIn,
              );
            },
            child: Text("1"),
          ),
        ),

        Container(
          child: ElevatedButton(
            onPressed: () {
              pageController.nextPage(
                duration: Duration(milliseconds: 1),
                curve: Curves.easeIn,
              );
            },
            child: Text("2"),
          ),
        ),

        Container(
          child: ElevatedButton(
            onPressed: () {
              pageController.nextPage(
                duration: Duration(milliseconds: 1),
                curve: Curves.easeIn,
              );
            },
            child: Text("3"),
          ),
        ),
      ],
    );
  }
}
