import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/data/write_data.dart';
import 'package:intl/intl.dart';

List<dynamic> mainDataCollection = [
  {
    "Hello": [
      {"date": "27 Apr", "done": true},
      {"date": "28 Apr", "done": true},
      {"date": "29 Apr", "done": true},
      {"date": "30 Apr", "done": true},
      {"date": "1 May", "done": true},
      {"date": "2 May", "done": true},
      {"date": "3 May", "done": true}
    ]
  },
];

void main() async {
  mainDataCollection.add(DATAFORMAT(habbitName: "habbit2").dataFormat());
  writeData("lib/data/data.json", mainDataCollection);
}

class DATAFORMAT {
  final String habbitName;
  final List dateData = [];

  DATAFORMAT({required this.habbitName});

  void dateGiver() {
    Map individualdateData = {};
    for (int i = 0; i < 7; i++) {
      DateTime date = DateTime.now().add(Duration(days: i));
      DateFormat formatter = DateFormat('d MMM');
      String formattedDate = formatter.format(date);
      individualdateData = {"date": formattedDate, "done": true};

      dateData.add(individualdateData);
    }
  }

  Map dataFormat() {
    dateGiver();
    return {habbitName: dateData};
  }
}
