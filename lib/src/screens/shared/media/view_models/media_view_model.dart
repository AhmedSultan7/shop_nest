import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import '../repository/local_media_repo.dart';

class MediaVM extends ChangeNotifier {
  final _mediaRepo = LocalMediaRepo();

  FilePickerResult? _filePickerResult;

  List<String> get filesPaths =>
      _filePickerResult?.paths.map((e) => e ?? '').toList() ?? [];

  Future<FilePickerResult?> pickFile(
    BuildContext context, {
    bool imageUpload = true,
    bool allowMultiple = false,
    int oldFilesLength = 0,
  }) async {
    try {
      final pickedFiles = await _mediaRepo.pickFiles(context,
          imageUpload: imageUpload,
          uploadMultiple: allowMultiple,
          oldFilesLength: oldFilesLength);

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
