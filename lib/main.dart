import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/pages/home.dart';

import 'package:habbit_tracker_flutter/providers/special_checkbox_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}
