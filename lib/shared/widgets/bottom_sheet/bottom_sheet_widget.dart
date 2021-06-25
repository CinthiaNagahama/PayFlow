import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/label_buttons/label_buttons_widget.dart';

class BottomSheetW extends StatelessWidget {
  final String leftLabel;
  final VoidCallback leftOnPressed;

  final String rightLabel;
  final VoidCallback rightOnPressed;

  final String title;
  final String subtitle;

  const BottomSheetW({
    Key? key,
    required this.leftLabel,
    required this.leftOnPressed,
    required this.rightLabel,
    required this.rightOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          style: AppTextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                              text: "\n$subtitle",
                              style: AppTextStyles.buttonHeading,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    LabelButtonsW(
                      leftLabel: leftLabel,
                      leftOnPressed: leftOnPressed,
                      enablePrimaryColorLeft: true,
                      rightLabel: rightLabel,
                      rightOnPressed: rightOnPressed,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
