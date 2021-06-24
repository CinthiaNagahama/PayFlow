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

  final bool enablePrimaryColor;
  const LabelButtonsW({
    Key? key,
    required this.leftLabel,
    required this.leftOnPressed,
    required this.rightLabel,
    required this.rightOnPressed,
    this.enablePrimaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
      color: AppColors.shape,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: leftLabel,
              onPressed: leftOnPressed,
              style: enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
            ),
          ),
          VerticalDividerW(),
          Expanded(
            child: LabelButton(
              label: rightLabel,
              onPressed: rightOnPressed,
            ),
          ),
        ],
      ),
    );
  }
}
