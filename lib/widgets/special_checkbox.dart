import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/providers.dart';
import 'package:provider/provider.dart';

class SpecialCheckbox extends StatefulWidget {
  const SpecialCheckbox({super.key});

  @override
  State<SpecialCheckbox> createState() => _SpecialCheckboxState();
}

class _SpecialCheckboxState extends State<SpecialCheckbox> {
  @override
  Widget build(BuildContext context) {
    PDS pds = Provider.of<PDS>(context);

    return Consumer<PDS>(builder: (context, pds, _) {
      return SafeArea(
        child: ListView.builder(
            itemCount: constants.length,
            itemBuilder: (context, index) {
              // final Map<String, dynamic> dateData =
              //     constants[0]['data'][index];
              return GestureDetector(
                onTap: () {
                  pds.addNewData("ok");
                },
                child: Container(
                  width: 20,
                  height: 20,
                  color: Colors.yellow,
                  child: Text(constants[index]["habbitName"]),
                ),
              );
            }),
      );
    });
  }
}
