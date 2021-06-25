import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/vertical_divider/vertical_divider_widget.dart';

class LabelButtonsW extends StatelessWidget {
  final String leftLabel;
  final VoidCallback leftOnPressed;

  final String rightLabel;
  final VoidCallback rightOnPressed;

  final bool enablePrimaryColorLeft;
  final bool enablePrimaryColorRight;

  const LabelButtonsW({
    Key? key,
    required this.leftLabel,
    required this.leftOnPressed,
    required this.rightLabel,
    required this.rightOnPressed,
    this.enablePrimaryColorLeft = false,
    this.enablePrimaryColorRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: size.height * 0.1 - 1,
            child: Row(
              children: [
                Expanded(
                  child: LabelButton(
                    label: leftLabel,
                    onPressed: leftOnPressed,
                    style: enablePrimaryColorLeft ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
                VerticalDividerW(),
                Expanded(
                  child: LabelButton(
                    label: rightLabel,
                    onPressed: rightOnPressed,
                    style: enablePrimaryColorRight ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
