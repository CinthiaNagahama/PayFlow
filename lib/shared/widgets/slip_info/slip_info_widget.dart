import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/vertical_divider/vertical_divider_widget.dart';

class SlipInfoW extends StatelessWidget {
  final int quantity;
  SlipInfoW({Key? key, required this.quantity}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logoMini,
              color: AppColors.background,
              width: size.width * 0.14,
              height: size.height * 0.14,
            ),
            VerticalDividerW(),
            Text.rich(
              TextSpan(
                text: "Você tem ",
                style: AppTextStyles.captionBackground,
                children: [
                  TextSpan(text: "$quantity boletos\n", style: AppTextStyles.captionBoldBackground),
                  TextSpan(text: "cadastrados para pagar", style: AppTextStyles.captionBackground),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
