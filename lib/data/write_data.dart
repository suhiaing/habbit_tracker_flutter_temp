import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> writeData(String filePath, List<dynamic> content) async {
  try {
    final file = File(filePath);

    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    final jsonString = jsonEncode(content);
    await file.writeAsString(jsonString);
  } on FileSystemException catch (e) {
    return Future.error('Error reading file: $e');
  }
}
