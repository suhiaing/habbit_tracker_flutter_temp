import 'dart:io';

import 'package:habbit_tracker_flutter/data/create_new_data.dart';

String newHabbit = "Hello";

void main() async {}

void writeDataToJSON(String newHabbit) async {
  CreateNewData newClass = CreateNewData(newHabbit);

  String jsonString = newClass.jsonData;
  try {
    final file = File('lib/file.json');
    final sink = file.openWrite(mode: FileMode.write);
    sink.write(jsonString);
    await sink.flush();
    print('JSON string written to file.json');
  } catch (e) {
    print(e);
  }
}
