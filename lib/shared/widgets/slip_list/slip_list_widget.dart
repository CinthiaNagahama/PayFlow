import 'package:flutter/material.dart';
import 'package:payflow/shared/models/slip_model.dart';
import 'package:payflow/shared/widgets/slip_list/slip_list_controller.dart';
import 'package:payflow/shared/widgets/slip_tile/slip_tile_widget.dart';

class SlipListW extends StatefulWidget {
  final SlipListController controller;
  SlipListW({Key? key, required this.controller}) : super(key: key);

  @override
  _SlipListWState createState() => _SlipListWState();
}

class _SlipListWState extends State<SlipListW> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<SlipModel>>(
      valueListenable: widget.controller.slipsNotifier,
      builder: (_, slips, __) => Column(
        children: slips.map((e) => SlipTileW(data: e)).toList(),
      ),
    );
  }
}
