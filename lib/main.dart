import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool done = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(() {
              done = !done;
            });
          },
          child: Container(
            width: 100,
            height: 100,
            color: done == true ? Colors.red : Colors.blue,
          ),
        ),
      ),
    );
  }
}
