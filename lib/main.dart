import 'package:flutter/material.dart';
import 'package:habbit_tracker_flutter/providers/providers.dart';
import 'package:habbit_tracker_flutter/widgets/special_checkbox.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PDS(),
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
    return const MaterialApp(
      home: Scaffold(
        body: SpecialCheckbox(),
      ),
    );
  }
}
