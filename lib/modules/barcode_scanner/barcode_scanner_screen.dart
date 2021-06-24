import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/label_buttons/label_buttons_widget.dart';

class BarcodeScannerScreen extends StatefulWidget {
  BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_slip");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: status.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Escaneie o código de barras do boleto", style: AppTextStyles.buttonBackground),
                centerTitle: true,
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(color: Colors.black.withOpacity(0.5)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.transparent),
                  ),
                  Expanded(
                    child: Container(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              bottomNavigationBar: LabelButtonsW(
                leftLabel: "Inserir código do boleto",
                leftOnPressed: () {},
                rightLabel: "Adicionar da galeria",
                rightOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetW(
                  leftLabel: "Escanear novamente",
                  leftOnPressed: () {
                    controller.getAvailableCameras();
                  },
                  rightLabel: "Digitar código",
                  rightOnPressed: () {},
                  title: "Não foi possível identificar um código de barras.",
                  subtitle: "Tente escanear novamente ou digite o código do seu boleto",
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
