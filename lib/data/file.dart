import 'package:intl/intl.dart';

List<Map<String, List<Map<String, dynamic>>>> data = [
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

class DATA {
  String habbitName;
  late List<Map<String, dynamic>> dateData;

  DATA(this.habbitName) {
    dateGiver();
  }

  void dateGiver() {
    Map<String, dynamic> individualdateData = {};
    for (int i = 0; i < 7; i++) {
      DateTime date = DateTime.now().add(Duration(days: i));
      DateFormat formatter = DateFormat('d MMM');
      String formattedDate = formatter.format(date);
      individualdateData = {"date": formattedDate, "done": true};

      dateData.add(individualdateData);
    }
  }
}
