import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<List<dynamic>> readFile(String filePath) async {
  // Read data as string from file
  final file = File(filePath);
  final jsonString = await file.readAsString();

  try {
    // Decode JSON string to data list
    final data = jsonDecode(jsonString) as List<dynamic>;
    return data;
  } catch (e) {
    // Handle other unexpected errors (e.g., print message)
    return Future.error('Error reading file: $e');
  }
}
