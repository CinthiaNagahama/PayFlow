import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class VerticalDividerW extends StatelessWidget {
  const VerticalDividerW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
    );
  }
}
