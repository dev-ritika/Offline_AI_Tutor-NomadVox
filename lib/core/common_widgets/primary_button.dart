import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/utils/constants/color_consts.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String buttonText;

  const PrimaryButton({super.key, this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            colors: [
              ColorConsts.buttonPLinearColor1,
              ColorConsts.buttonPLinearColor2,
            ],
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: double.infinity,
            height: 46,
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: buttonText,

                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const WidgetSpan(
                      // baseline: TextBaseline.alphabetic,
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: ColorConsts.whiteColor,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
