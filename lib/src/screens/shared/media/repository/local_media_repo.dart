import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalMediaRepo {
  Future<FilePickerResult?> pickFiles(
      {bool imageUpload = true, bool uploadMultiple = true}) async {
    try {
      await _getPermission();
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: imageUpload ? FileType.image : FileType.any,
        allowMultiple: uploadMultiple,
      );

      return result;
    } catch (e) {
      debugPrint('error $e');
      return null;
    }
  }

  Future<void> _getPermission() async {
    if (await Permission.storage.isGranted) return;
    try {
      await Permission.storage.request();
    } catch (e) {
      debugPrint('error $e');
    }
  }
}
