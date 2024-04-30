import 'dart:convert';

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

// Function to read the JSON file and convert it to a Map
Future<List<Map<String, dynamic>>> readJson(String filePath) async {
  try {
    final jsonString = await readFile(filePath);
    final data = jsonDecode(jsonString) as List<Map<String, dynamic>>;
    return data;
  } catch (e) {
    // Handle other exceptions (e.g., invalid JSON format)
    debugPrint("Error parsing JSON: $e");
    return []; // Return an empty list on error
  }
}

Future<String> readFile(String filePath) async {
  try {
    final file = File(filePath);
    final content = await file.readAsString();
    return content;
  } on FileSystemException catch (e) {
    // Handle file system errors (e.g., file not found)
    debugPrint("Error reading file: $filePath - $e");
    return ""; // Return an empty string on error
  }
}
