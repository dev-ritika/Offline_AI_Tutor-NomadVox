import 'package:flutter/material.dart';
import 'package:offline_ai_tutor/core/common_widgets/select_icon.dart';
import 'package:offline_ai_tutor/core/utils/constants/color_consts.dart';

class SelectableContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color1;
  final Color? color2;
  final bool isSelected;
  final Color? borderColor;
  final Widget? leadingItem;

  final Widget? middleItem;
  final Widget? trailingItem;

  const SelectableContainer({
    super.key,
    this.borderColor,
    this.height,
    this.width,
    this.color1,
    this.color2,
    required this.isSelected,
    this.leadingItem,
    this.middleItem,
    this.trailingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          style: BorderStyle.solid,
          width: 1.2,

          color: borderColor ?? ColorConsts.buttonSecondaryStrokeColor,
        ),
        gradient: LinearGradient(
          colors: [
            color1 ?? ColorConsts.buttonSecondaryColor,
            color2 ?? ColorConsts.buttonSecondaryColor,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leadingItem != null)
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: leadingItem!,
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "French",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "French wjhf jhwdjk fh",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),

            const Spacer(),

            if (trailingItem != null) trailingItem!,

            if (isSelected) const SelectIcon(),
          ],
        ),
      ),
    );
  }
}
