import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/constants.dart';
import 'package:habbit_tracker_flutter/providers/main_provider.dart';
import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:habbit_tracker_flutter/widgets/special_checkbox.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPVDS>(
      builder: (context, mainPVDS, _) {
        return MaterialApp(
          home: Scaffold(
            body: GestureDetector(
              onTap: () {},
              child: SpecialCheckbox(
                  done: constants[0]["data"][0]["done"], date: "13 May"),
            ),
          ),
        );
      },
    );
  }
}
