import 'package:flutter/material.dart';

class SpecialCheckboxProvider extends ChangeNotifier {
  SpecialCheckboxProvider();
  List<Map<String, dynamic>> data = [];

  void nl() {
    notifyListeners();
  }
}
