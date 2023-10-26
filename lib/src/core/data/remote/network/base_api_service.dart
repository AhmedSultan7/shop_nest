import 'package:file_picker/file_picker.dart';

abstract class BaseApiServices {
  Future<dynamic> getResponse(String url);

  Future<dynamic> postResponse(
    String url, {
    required Map<String, dynamic> data,
    FilePickerResult? fileResult,
    String? fieldName,
  });

  Future<dynamic> putResponse(
    String url, {
    required Map<String, dynamic> data,
    FilePickerResult? fileResult,
    String? fieldName,
  });

  Future<dynamic> deleteResponse(String url);
}
