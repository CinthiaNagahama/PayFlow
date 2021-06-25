import 'package:flutter/material.dart';
import 'package:payflow/shared/models/slip_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertSlipController {
  final formKey = GlobalKey<FormState>();
  SlipModel model = SlipModel();

  String? validateName(String? value) => value?.isEmpty ?? true ? "O nome do boleto não pode ser vazio" : null;
  String? validateDueDate(String? value) {
    if (value?.isEmpty == true) {
      return "A data de vencimento não pode ser vazia";
    }

    if (int.parse(value!.substring(0, 2)) > 31 ||
        int.parse(value.substring(3, 5)) > 12 ||
        int.parse(value.substring(6, 10)) < 2021) {
      return "Data de vencimento inválida";
    }
  }

  String? validateValue(double? value) => value == 0 ? "Insira um valor maio que R\$ 0,00" : null;
  String? validateBarcode(String? value) => value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange({String? name, String? dueDate, double? value, String? barcode}) {
    model = model.copyWith(name: name, dueDate: dueDate, value: value, barcode: barcode);
  }

  Future<void> saveSlip() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final slipList = instance.getStringList("slips") ?? <String>[];
      slipList.add(model.toJson());
      await instance.setStringList("slips", slipList);
      return;
    } catch (e) {
      print(e);
    }
  }

  Future<void> registerSlip() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      return await saveSlip();
    }
  }
}
