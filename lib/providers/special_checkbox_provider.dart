import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:intl/intl.dart';

class SpecialCheckBoxPVD extends ChangeNotifier {
  List scbConstants = constants;
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
    } else {
      print("Just care about today");
    }
  }
}
