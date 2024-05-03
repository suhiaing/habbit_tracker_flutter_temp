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
    print('File written successfully!');
  } on FileSystemException catch (e) {
    print('Error writing to file: $e');
  }
}
