import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_slip/insert_slip_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/label_buttons/label_buttons_widget.dart';

class InsertSlipScreen extends StatefulWidget {
  final String? barcode;
  const InsertSlipScreen({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertSlipScreenState createState() => _InsertSlipScreenState();
}

class _InsertSlipScreenState extends State<InsertSlipScreen> {
  final controller = InsertSlipController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );
  final duaDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
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
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputTextW(
                      label: "Nome do boleto",
                      validator: controller.validateName,
                      icon: Icons.description_outlined,
                      onChanged: (value) {
                        controller.onChange(name: value);
                      },
                    ),
                    InputTextW(
                      label: "Vencimento",
                      controller: duaDateInputTextController,
                      validator: controller.validateDueDate,
                      icon: FontAwesomeIcons.timesCircle,
                      onChanged: (value) {
                        controller.onChange(dueDate: value);
                      },
                    ),
                    InputTextW(
                      label: "Valor",
                      controller: moneyInputTextController,
                      validator: (_) => controller.validateValue(moneyInputTextController.numberValue),
                      icon: Icons.account_balance_wallet_outlined,
                      onChanged: (value) {
                        controller.onChange(value: moneyInputTextController.numberValue);
                      },
                    ),
                    InputTextW(
                      label: "Código do boleto",
                      controller: barcodeInputTextController,
                      validator: controller.validateBarcode,
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) {
                        controller.onChange(barcode: value);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: LabelButtonsW(
        leftLabel: "Cancelar",
        leftOnPressed: () {
          Navigator.pop(context);
        },
        rightLabel: "Cadastrar",
        rightOnPressed: () async {
          if (await controller.registerSlip()) {
            Navigator.pop(context);
          }
        },
        enablePrimaryColorRight: true,
      ),
    );
  }
}
