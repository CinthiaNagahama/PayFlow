import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/label_buttons/label_buttons_widget.dart';

class InsertSlipScreen extends StatelessWidget {
  const InsertSlipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24),
              child: Text(
                "Preencha os dados do boleto.",
                style: AppTextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            InputTextW(
              label: "Nome do boleto",
              icon: Icons.description_outlined,
              onChanged: (value) {},
            ),
            InputTextW(
              label: "Vencimento",
              icon: FontAwesomeIcons.timesCircle,
              onChanged: (value) {},
            ),
            InputTextW(
              label: "Valor",
              icon: Icons.account_balance_wallet_outlined,
              onChanged: (value) {},
            ),
            InputTextW(
              label: "Código do boleto",
              icon: FontAwesomeIcons.barcode,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: LabelButtonsW(
        leftLabel: "Cancelar",
        leftOnPressed: () {
          Navigator.pop(context);
        },
        rightLabel: "Cadastrar",
        rightOnPressed: () {},
        enablePrimaryColorRight: true,
      ),
    );
  }
}
