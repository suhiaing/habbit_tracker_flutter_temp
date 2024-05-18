import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/data/read_file.dart';
import 'package:habbit_tracker_flutter/pages/particular_data_table.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> constantF;
  @override
  void initState() {
    super.initState();
    constantF = readFile("data.json");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: constantF,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          constants = snapshot.data!;
          List<dynamic> firstDate = constants[0]["data"];
          int lengthOfDate = (firstDate.length) + 1;
          return ParticularDataTable(
              lengthOfDate: lengthOfDate, firstDate: firstDate);
        });
  }
}
