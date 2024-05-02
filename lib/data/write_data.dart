import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<void> writeData(String filePath, List<dynamic> content) async {
  try {
    final file = File(filePath);

    // Check if the file exists
    if (!await file.exists()) {
      // Create the file if it doesn't exist
      await file.create(
          recursive: true); // Set recursive to create directories if needed
    }
    final jsonString = jsonEncode(content);
    await file.writeAsString(jsonString);
    print('File written successfully!');
  } on FileSystemException catch (e) {
    // Handle specific FileSystemException errors (e.g., permission denied)
    print('Error writing to file: $e');
  }
}
