import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:offline_ai_tutor/core/utils/constants/color_consts.dart';

class SelectIcon extends StatelessWidget {
  final Color? bgColor;
  final Color? iconColor;

  const SelectIcon({super.key, this.bgColor, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor ?? ColorConsts.buttonPLinearColor1,
      ),
      height: 20,
      width: 20,
      child: Center(
        child: SvgPicture.asset(
          "assets/images/tick.svg",
          width: 11,
          height: 11,
          colorFilter: ColorFilter.mode(
            iconColor ?? ColorConsts.whiteColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
