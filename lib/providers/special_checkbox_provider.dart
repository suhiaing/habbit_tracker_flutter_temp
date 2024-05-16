import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/main_provider.dart';
import 'package:intl/intl.dart';

class SpecialCheckBoxPVD extends MainPVDS {
  List scbConstants = constants;

  String todayDate() {
    DateTime date = DateTime.now();
    DateFormat formatter = DateFormat('d MMM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  void onChangedSCP(String currentDate, int indexOfConstants, int indexOfData) {
    String today = todayDate();
    if (today == currentDate) {
      constants[indexOfConstants]["data"][indexOfData]["done"] =
          !constants[indexOfConstants]["data"][indexOfData]["done"];
      nl();
      refreshData(constants);
    } else {
      debugPrint("Just care about today");
    }
  }

  void showMySnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Just care about today!'),
      ),
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   List<String> labelList = [];

//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> constant = constants;
//     List<Map> firstDate = constant[0]["data"];
//     int lengthOfDate = (firstDate.length) + 1;
//     return MaterialApp(
//       home: Scaffold(
//         body: Consumer<MainPVDS>(
//           builder: (context, mainPVDS, _) {
//             return DataTable(
//               columns: List.generate(
//                 lengthOfDate,
//                 (index) {
//                   int currentIndexMinusOne = index - 1;
//                   String currentDate = '';
//                   if (index == 0) {
//                     currentDate = "Habbit Name";
//                   } else {
//                     currentDate = firstDate[currentIndexMinusOne]["date"];
//                     setState(() {
//                       labelList.add(currentDate);
//                     });
//                   }

//                   return DataColumn(
//                     label: Expanded(
//                       child: Text(
//                         currentDate,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               rows: List.generate(constants.length, (index) {
//                 Map<String, dynamic> currentData = constants[index];
//                 String habbitName = currentData["habbitName"];

//                 return DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text(habbitName)),
//                     for (int i = 0; i < currentData["data"].length; i++)
//                       DataCell(
//                         currentData["data"][i]["date"] == labelList[i]
//                             ? SpecialCheckbox(
//                                 done: currentData["data"][i]["done"],
//                                 date: currentData["data"][i]["date"],
//                                 indexOfConstant: index,
//                                 indexOfData: i)
//                             : const Text("error"),
//                       ),
//                   ],
//                 );
//               }),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }