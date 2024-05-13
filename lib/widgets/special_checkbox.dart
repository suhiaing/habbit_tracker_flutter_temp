// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:provider/provider.dart';

class SpecialCheckbox extends StatefulWidget {
  bool done;
  String date;
  SpecialCheckbox({required this.done, required this.date, super.key});

  @override
  State<SpecialCheckbox> createState() => _SpecialCheckboxState();
}

class _SpecialCheckboxState extends State<SpecialCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SpecialCheckBoxPVD>(
        builder: (context, specialCheckBoxPVD, _) {
      return GestureDetector(
          onTap: () {
            specialCheckBoxPVD.onChangedSCP(widget.done, widget.date);
          },
          child: Container(
            width: 40,
            height: 40,
            color: widget.done == true ? Colors.green : Colors.red,
          ));
    });
  }
}
