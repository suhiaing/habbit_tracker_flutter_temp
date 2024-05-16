import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/data_format.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';

class MainPVDS extends ChangeNotifier {
  MainPVDS() {
    gettingDataFromJSONfile();
  }

  void gettingDataFromJSONfile() async {
    constants = await readFile('data.json');

    nl();
  }

  void addNewData(String habbit) async {
    constants.add(DATAFORMAT(habbitname: habbit).dataFormat());
    nl();
  }

  void refreshData(List<dynamic> constants) {
    rewriteData(constants);
    gettingDataFromJSONfile();
  }

  void rewriteData(List<dynamic> constants) {
    writeData('data.json', constants);
  }

  void removeData(Map data) {
    constants.remove(data);
    nl();
  }

  void nl() {
    notifyListeners();
  }
}
