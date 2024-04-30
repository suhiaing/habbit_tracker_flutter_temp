import 'package:intl/intl.dart';

//date_section

List<Map<String, dynamic>> dateGiver(int plannedTime) {
  final List<Map<String, dynamic>> dateData = [];

  Map<String, dynamic> individualdateData = {};
  for (int i = 0; i < plannedTime; i++) {
    DateTime date = DateTime.now().add(Duration(days: i));
    DateFormat formatter = DateFormat('d MMM');
    String formattedDate = formatter.format(date);
    individualdateData = {"date": formattedDate, "done": true};

    dateData.add(individualdateData);
  }
  return dateData;
}
