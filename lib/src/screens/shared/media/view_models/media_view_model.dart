import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import '../repository/local_media_repo.dart';

class MediaVM extends ChangeNotifier {
  final _mediaRepo = LocalMediaRepo();

  FilePickerResult? _filePickerResult;

  FilePickerResult? get filePickerResult => _filePickerResult;

  Future<FilePickerResult?> pickFile({
    bool imageUpload = true,
    bool allowMultiple = false,
  }) async {
    try {
      final pickedFiles = await _mediaRepo.pickFiles(
          imageUpload: imageUpload, uploadMultiple: allowMultiple);

      if (pickedFiles == null) return null;

      _filePickerResult = pickedFiles;

      notifyListeners();

      return pickedFiles;
    } on Exception catch (e) {
      debugPrint('Error Getting File $e');
      rethrow;
    }
  }

  void clearFiles() {
    _filePickerResult = null;
    notifyListeners();
  }

  void removeFile(int index) {
    _filePickerResult?.files.removeAt(index);
    notifyListeners();
  }
}
