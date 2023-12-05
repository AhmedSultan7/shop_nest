abstract class BaseApiServices {
  Future<dynamic> getResponse(String url);

  Future<dynamic> postResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String>? fileResult,
    String? fieldName,
  });

  Future<dynamic> postOrderResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String?> filePaths = const [],
    bool fromAuth = false,
  });

  Future<dynamic> putResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String>? fileResult,
    String? fieldName,
    int? id,
  });

  Future<dynamic> deleteResponse(String url);
}
