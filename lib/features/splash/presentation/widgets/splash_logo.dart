import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/utils/constants/assets_consts.dart';
import 'package:offline_ai_tutor/features/splash/presentation/utils/animation/splash_animation.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _size;
  late final Animation<double> _opacity;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _size = SplashAnimation.build(_animationController);

    _opacity = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0, 0.4, curve: Curves.easeIn),
    );

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
    return FadeTransition(
      opacity: _opacity,
      child: AnimatedBuilder(
        animation: _size,
        builder: (context, child) {
          return Image.asset(
            AssetsConsts.logoImage,
            height: _size.value,
            width: _size.value,
          );
        },
      ),
    );
  }
}
