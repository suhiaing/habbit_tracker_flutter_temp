import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/data_format.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';

class PDS extends ChangeNotifier {
  PDS() {
    gettingDataFromJSONfile();
  }

  void gettingDataFromJSONfile() async {
    constants = await readFile('data.json');
    nl();
  }

  void addNewData(String habbit) {
    constants.add(DATAFORMAT(habbitname: "Hello").dataFormat());
    nl();
  }

  void removeDataI(Map data) {
    constants.remove(data);
    nl();
  }

  void changebool(bool done) {
    done = !done;
  }

  void nl() {
    notifyListeners();
  }
}
