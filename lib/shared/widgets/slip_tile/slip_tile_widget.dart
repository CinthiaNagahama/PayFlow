import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/slip_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SlipTileW extends StatelessWidget {
  final SlipModel data;
  const SlipTileW({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.bottom,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            data.name!,
            style: AppTextStyles.titleListTile,
          ),
          subtitle: Text(
            "Vence em ${data.dueDate}",
            style: AppTextStyles.captionBody,
          ),
          trailing: Text.rich(
            TextSpan(
              text: "R\$",
              style: AppTextStyles.trailingRegular,
              children: [
                TextSpan(
                  text: "${data.value!.toStringAsFixed(2)}",
                  style: AppTextStyles.trailingBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
