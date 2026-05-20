import 'package:flutter/material.dart';

class SplashAnimation {
  static Animation<double> build(AnimationController animationController) {
    return TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 0,
          end: 400,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 60,
      ),

      TweenSequenceItem(
        tween: Tween<double>(
          begin: 400,
          end: 300,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );
  }
}
