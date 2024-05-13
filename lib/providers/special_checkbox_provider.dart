import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/main_provider.dart';
import 'package:intl/intl.dart';

class SpecialCheckBoxPVD extends ChangeNotifier {
  void nl() {
    notifyListeners();
  }

  String todayDate() {
    DateTime date = DateTime.now();
    DateFormat formatter = DateFormat('d MMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  void onChangedSCP(bool val, String currentDate) {
    debugPrint(constants.toString());
    String today = todayDate();
    if (today == currentDate) {
      constants[0]["data"][0]["done"] = !constants[0]["data"][0]["done"];
      nl();
      print(constants[0]["data"][0]["done"]);
    }
  }
}
