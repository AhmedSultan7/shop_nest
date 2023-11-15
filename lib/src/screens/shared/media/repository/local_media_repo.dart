import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class LocalMediaRepo {
  Future<FilePickerResult?> pickFiles(BuildContext context,
      {bool imageUpload = true,
      bool uploadMultiple = true,
      int oldFilesLength = 2}) async {
    try {
      await _getPermission();
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: imageUpload ? FileType.image : FileType.any,
        allowMultiple: uploadMultiple,
      );

      final totalMaxFilesLength = 4 - oldFilesLength;

      //! Check if any file more than 5 mg
      if (!context.mounted) return null;

      final isMoreThan5MG = _checkFilesSize(context, result: result);

      if (isMoreThan5MG) return null;

      //! Check if total files more than 4
      final isMoreThan4Files = _checkFilesLength(
        context,
        result: result,
        totalMaxFilesLength: totalMaxFilesLength,
      );

      if (isMoreThan4Files) return null;

      return result;
    } catch (e) {
      debugPrint('error $e');
      return null;
    }
  }

  bool _checkFilesSize(
    BuildContext context, {
    required FilePickerResult? result,
  }) {
    final anyImageMoreThan5MG =
        result?.files.any((element) => element.size > 5 * 1024 * 1024) ?? false;

    if (result != null && result.files.isNotEmpty && anyImageMoreThan5MG) {
      if (context.mounted) {
        context.showBarMessage(context.tr.maxUploadFileSizeIsOnly5MB,
            isError: true);
      }
      return true;
    }

    return false;
  }

  bool _checkFilesLength(
    BuildContext context, {
    required FilePickerResult? result,
    required int totalMaxFilesLength,
  }) {
    if (result != null &&
        result.files.isNotEmpty &&
        result.files.length > totalMaxFilesLength) {
      if (context.mounted) {
        context.showBarMessage(context.tr.maxUploadFilesIsOnly4, isError: true);
      }
      return true;
    }

    return false;
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
