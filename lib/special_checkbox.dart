import 'package:flutter/material.dart';

class SpecialCheckbox extends StatefulWidget {
  const SpecialCheckbox({super.key});

  @override
  State<SpecialCheckbox> createState() => _SpecialCheckboxState();
}

class _SpecialCheckboxState extends State<SpecialCheckbox> {
  bool done = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            done = !done;
          });
        },
        child: Container(
          width: 100,
          height: 100,
          color: done == true ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}
