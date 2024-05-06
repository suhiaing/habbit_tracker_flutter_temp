import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/data_format.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';

class PDS extends ChangeNotifier {
  PDS() {
    gettingDataFromJSONfile();
  }

  void gettingDataFromJSONfile() async {
    constants = await readFile('data.json');
    print("from gettingDataFromJSONfile fun: $constants \n");
    nl();
  }

  void addNewData(String habbit) async {
    print("from the first line of addNewData fun$constants \n");
    constants.add(DATAFORMAT(habbitname: habbit).dataFormat());
    nl();
    print("after adding into constants $constants \n");
    writeDataAgain(constants);
    gettingDataFromJSONfile();
    print("after rewrite gettingDataFrom Json $constants \n");
  }

  void writeDataAgain(List<dynamic> constants) {
    writeData('data.json', constants);
  }

  void removeData(Map data) {
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
