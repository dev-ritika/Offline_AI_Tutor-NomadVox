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
  final String title;
  final String subtitle;

  // final Widget? middleItem;
  final Widget? trailingItem;
  final VoidCallback onTap;

  const SelectableContainer({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    this.borderColor,
    this.height,
    this.width,
    this.color1,
    this.color2,
    required this.isSelected,
    this.leadingItem,
    //  this.middleItem,
    this.trailingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        onTap: onTap,
        child: Container(
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

                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

                if (trailingItem != null) trailingItem!,

                if (isSelected)
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SelectIcon(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
