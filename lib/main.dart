import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/pages/particular_data_table.dart';
import 'package:habbit_tracker_flutter/providers/main_provider.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => MainPVDS())),
        ChangeNotifierProvider(create: ((context) => SpecialCheckBoxPVD()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(244, 237, 202, 1)),
      home: Scaffold(
        body: Consumer<MainPVDS>(
          builder: (context, mainPVDS, _) {
            List<dynamic> firstDate = constants[0]["data"];
            int lengthOfDate = (firstDate.length) + 1;
            return ParticularDataTable(
                lengthOfDate: lengthOfDate, firstDate: firstDate);
          },
        ),
      ),
    );
  }
}
