import 'package:flutter/material.dart';
import 'package:payflow/shared/models/slip_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/slip_info/slip_info_widget.dart';
import 'package:payflow/shared/widgets/slip_list/slip_list_controller.dart';
import 'package:payflow/shared/widgets/slip_list/slip_list_widget.dart';

class MyBankSlipsScreen extends StatefulWidget {
  const MyBankSlipsScreen({Key? key}) : super(key: key);

  @override
  _MyBankSlipsScreenState createState() => _MyBankSlipsScreenState();
}

class _MyBankSlipsScreenState extends State<MyBankSlipsScreen> {
  final controller = SlipListController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: size.height * 0.06,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<SlipModel>>(
                  valueListenable: controller.slipsNotifier,
                  builder: (_, slips, __) => SlipInfoW(quantity: slips.length),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "Meus boletos",
                  style: AppTextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SlipListW(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
