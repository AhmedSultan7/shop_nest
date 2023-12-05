import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cards_app/src/core/data/remote/response/api_strings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import '../../../utils/logger.dart';
import '../app_exception.dart';
import '../response/api_end_points.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiServices {
  //! Get request
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final endpoint = ApiEndPoints.baseUrl + url;

      final populate = endpoint.contains('?') ? '&' : '?';

      final apiUrl = endpoint + populate + ApiEndPoints.populate;

      Log.i('apiUrl => $apiUrl');

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${sl<ConfigData>().token!}',
        },
      );

      Log.i('URL -> $apiUrl\n 💾💾💾 GetResponse -> ${response.body} 💾💾💾');

      responseJson = returnResponse(response);
    } on SocketException {
      rethrow;
    } catch (e) {
      throw FetchDataException(
          "FetchDataException: getResponse ${e.toString()}");
    }
    return responseJson;
  }

  @override
  Future postOrderResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String?> filePaths = const [],
    String fieldName = 'images',
    bool fromAuth = false,
  }) async {
    dynamic responseJson;
    try {
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(ApiEndPoints.baseUrl + url));

      if (fromAuth) {
        request.fields.addAll(
          data.map((key, value) => MapEntry(key, value.toString())),
        );
      } else {
        request.fields.addAll({
          "data": jsonEncode(data),
        });
      }

      log('PostResponseFields -------------------> ${data.map((key, value) => MapEntry(key, value.toString()))}');

      if (filePaths.isNotEmpty) {
        for (String? filePath in filePaths) {
          request.files.add(
              await http.MultipartFile.fromPath('files.$fieldName', filePath!));
        }
      }

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': "Bearer ${GetStorage().read(LocalKeys.token)}"
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseJson = await jsonDecode(await response.stream.bytesToString());
      } else {
        throw FetchDataException(
            'Error occurred while communication with server: ${await response.stream.bytesToString()} with status code : ${response.statusCode}');
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

// ! Post request
  Future postResponseLogin(
    String url, {
    required Map<String, dynamic> data,
    FilePickerResult? fileResult,
    String? fieldName,
  }) async {
    dynamic responseJson;
    // try {
    final apiUrl = Uri.parse(ApiEndPoints.baseUrl + url);

    Log.w('PostApiUrl => $apiUrl\n 💾💾💾 PostResponse -> $data 💾💾💾');

    final response = await http.post(apiUrl, body: data);

    Log.w('Res => ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      responseJson = await jsonDecode(response.body);

      return responseJson;
    } else {
      throw FetchDataException(
          'Error occurred while communication with server: ${response.body} with status code : ${response.statusCode}');
    }
    // } on SocketException {
    //   rethrow;
    // } on TimeoutException {
    //   rethrow;
    // } catch (e) {
    //   throw FetchDataException(
    //       "FetchDataException: getResponse ${e.toString()}");
    // }
  }

  @override
  Future postResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String>? fileResult,
    String? fieldName,
  }) async {
    dynamic responseJson;
    try {
      final apiUrl = Uri.parse(ApiEndPoints.baseUrl + url);

      if (url.contains('auth')) {
        responseJson = await postResponseLogin(url, data: data);

        return responseJson;
      }

      // data[ApiStrings.vendor] = VendorModel.currentVendorId();
      // AppConsts.vendorId;

      Log.w('PostApiUrl => $apiUrl\n 💾💾💾 PostResponse -> $data 💾💾💾');

      http.MultipartRequest request = http.MultipartRequest('POST', apiUrl);

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': "Bearer ${GetStorage().read(LocalKeys.token)}"
      });

      // final filePaths = fileResult?.files.map((e) => e.path).toList() ?? [];

      if (fileResult != null && fileResult.isNotEmpty) {
        for (int i = 0; i < fileResult.length; i++) {
          final filePath = fileResult[i];
          request.files.add(
              await http.MultipartFile.fromPath('files.$fieldName', filePath));
        }
      }

      final Map<String, String> fieldsData = data.map((key, value) {
        return MapEntry(key, value.toString());
      });

      request.fields.addAll({ApiStrings.data: jsonEncode(fieldsData)});

      final response = await http.Response.fromStream(await request.send())
          .timeout(const Duration(seconds: ApiStrings.timeOutDuration));

      Log.w('Res => ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseJson = await jsonDecode(response.body);
      } else {
        throw FetchDataException(
            'Error occurred while communication with server: ${response.body} with status code : ${response.statusCode}');
      }
    } on SocketException {
      rethrow;
    } on TimeoutException {
      rethrow;
    } catch (e) {
      throw FetchDataException(
          "FetchDataException: getResponse ${e.toString()}");
    }
    return responseJson;
  }

  @override
  Future putResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String>? fileResult,
    String? fieldName,
    int? id,
  }) async {
    dynamic responseJson;
    try {
      final putId = id ?? data[ApiStrings.id];

      final apiUrl = Uri.parse('${ApiEndPoints.baseUrl}$url/$putId');

      http.MultipartRequest request = http.MultipartRequest('PUT', apiUrl);

      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': "Bearer ${GetStorage().read(LocalKeys.token)}"
      });

      final filePaths = fileResult ?? [];

      if (filePaths.isNotEmpty) {
        //! Add new images
        for (int i = 0; i < filePaths.length; i++) {
          final filePath = filePaths[i];
          request.files.add(
              await http.MultipartFile.fromPath('files.$fieldName', filePath));
        }
      }

      final Map<String, String> fieldsData = data.map((key, value) {
        return MapEntry(key, value.toString());
      });

      request.fields.addAll({ApiStrings.data: jsonEncode(fieldsData)});

      final response = await http.Response.fromStream(await request.send())
          .timeout(const Duration(seconds: ApiStrings.timeOutDuration));

      Log.w('PutUrl => $apiUrl\nPutData => $data');

      // final putId = id ?? data[ApiStrings.id];
      //
      // final apiUrl = Uri.parse('${ApiEndPoints.baseUrl}$url/$putId');
      //
      // final response = await http.put(apiUrl, body: data);
      //
      // Log.w('PutUrl => $apiUrl\nPutData => $data');

      Log.w('Res => ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseJson = await jsonDecode(response.body);
      } else {
        throw FetchDataException(
            'Error occurred while communication with server: ${response.body} with status code : ${response.statusCode}');
      }
    } on SocketException {
      rethrow;
    } on TimeoutException {
      rethrow;
    } catch (e) {
      throw FetchDataException(
          "FetchDataException: getResponse ${e.toString()}");
    }
    return responseJson;
  }

  //! Delete request
  @override
  Future deleteResponse(String url) async {
    try {
      final apiUrl = Uri.parse(ApiEndPoints.baseUrl + url);

      return await http.delete(apiUrl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${sl<ConfigData>().token!}',
      }).then((value) {
        Log.e('DeleteResponse => URL: $apiUrl\nBody: ${value.body}');
        return value.body;
      });
    } on SocketException {
      rethrow;
    } on TimeoutException {
      rethrow;
    } catch (e) {
      throw FetchDataException(
          "FetchDataException: getResponse ${e.toString()}");
    }
  }

  //! Response handler
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body.toString());
      case 400:
        throw FetchDataException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server: ${response.body} with status code : ${response.statusCode}');
    }
  }
}
