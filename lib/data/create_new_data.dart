import 'package:intl/intl.dart';
import 'dart:convert' show json;

class CreateNewData {
  //date_section
  final List<Map<String, dynamic>> _dateData = [];

  void dateGiver() {
    Map<String, dynamic> individualdateData = {};
    for (int i = 0; i < 7; i++) {
      DateTime date = DateTime.now().add(Duration(days: i));
      DateFormat formatter = DateFormat('d MMM');
      String formattedDate = formatter.format(date);
      individualdateData = {"date": formattedDate, "done": true};

      _dateData.add(individualdateData);
    }
  }

  //data_section
  String jsonData = '';
  void dataGiving() {
    List<Map> mapData = [];

    mapData.add({newHabbit: _dateData});
    jsonData = json.encode(mapData);
  }

  String newHabbit = '';

  CreateNewData(this.newHabbit) {
    dateGiver();
    dataGiving();
  }
}
