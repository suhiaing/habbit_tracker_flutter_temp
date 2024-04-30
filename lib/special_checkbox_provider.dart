import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/data/read_jsonfile.dart';

class SpecialCheckboxProvider extends ChangeNotifier {
  SpecialCheckboxProvider() {
    readtheFile();
  }
  List<Map<String, dynamic>> data = [];
  void readtheFile() async {
    data = await readJson('data.json');
  }

  void nl() {
    notifyListeners();
  }
}
