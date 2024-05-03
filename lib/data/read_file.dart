import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<List<dynamic>> readFile(String filePath) async {
  final file = File(filePath);
  final jsonString = await file.readAsString();

  try {
    final data = jsonDecode(jsonString) as List<dynamic>;
    return data;
  } catch (e) {
    return Future.error('Error reading file: $e');
  }
}
