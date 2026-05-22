import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/utils/constants/assets_consts.dart';
import 'package:offline_ai_tutor/features/splash/presentation/utils/animation/splash_animation.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _anim;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _anim = SplashAnimation.build(_animationController);

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) {
        return FadeTransition(
          opacity: _animationController,
          child: Image.asset(
            AssetsConsts.logoImage,
            height: _anim.value,
            width: _anim.value,
          ),
        );
      },
    );
  }
}
