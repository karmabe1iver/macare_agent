import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:macare_agent/app/component/show_toast.dart';

import '../app.dart';
import '../presets/api_paths.dart';
import '../presets/api_paths.dart';
import '../routes/app_pages.dart';

class MyDio {
  static String baseUrl = ApiPaths.baseUrl;
  static String generalurl = ApiPaths.generalUrl;

  late Dio _dio;

  MyDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      // 30 seconds
      receiveTimeout: const Duration(seconds: 60),
      // 60 seconds

      responseType: ResponseType.plain,
      headers: {
        Headers.contentTypeHeader: "application/json",
        if (App.token.isNotEmpty) "Authorization": "Bearer ${App.token}",
      },
    );

    _dio = Dio(options);

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final HttpClient client =
          HttpClient(context: SecurityContext(withTrustedRoots: false));
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (ex, handel) {
        if (ex.response?.statusCode == 401) {
          print("Status[${ex.response?.statusCode}] : ${ex.requestOptions.baseUrl}${ex.requestOptions.path}");
          print("Data : ${ex.requestOptions.data}");
          showToast(msg: "Login Expired");
          Get.offAllNamed(Routes.LOGINPAGE);
        }
      },
      //     onResponse: (response, handler) {
      //   if (response.statusCode == 200) {
      //     Get.toNamed(Routes.LOGINPAGE);
      //   }
      // }
      ),
    );
  }

  Future<dynamic> customPost(
    String path, {
    data,
    baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Dio _dio = Dio();
      // (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
      //     (HttpClient client) {
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) => true;
      //   return null;
      // };

      Response resp = await _dio.post((baseUrl ?? generalurl) + path,
          data: data,
          options: Options(responseType: ResponseType.plain, headers: {
            Headers.contentTypeHeader: "application/json",
            if (App.token.isNotEmpty) "Authorization": "Bearer ${App.token}",
          }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');

      debugPrint("************** Response End ************************");
      dynamic apiResp = jsonDecode(resp.data);
      return apiResp;
    } on DioException catch (ex) {
      // nav.Get.to(MAErrorScreenWidget(onRetry: () {}));
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}");
      debugPrint("ResMethodType : [${ex.requestOptions.method}]");
      ex.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      ex.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(ex.requestOptions.queryParameters.toString());

      if (ex.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(ex.requestOptions.data)}");
      }
      log('error type >>>${ex.type}');
      debugPrint("************** Error End ************************");
      if (ex.type == DioExceptionType.connectionTimeout) {
        throw Exception(ex.message);
      } else {
        return ex;
      }
    }
  }

  Future<dynamic> multiPartPost(
    String path, {
    data,
    //required int length,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Dio dio = Dio();
      // (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
      //     (HttpClient client) {
      //   client.badCertificateCallback =
      //       (X509Certificate cert, String host, int port) => true;
      //   return null;
      // };

      Response resp = await dio.post(
        baseUrl + path,
        data: data,
        onSendProgress: onSendProgress,
        options: Options(
          responseType: ResponseType.json,
          headers: {
            //Headers.contentLengthHeader: length,
            Headers.contentTypeHeader: "multipart/form-data",
            if (App.token.isNotEmpty) "Authorization": "Bearer ${App.token}",
          },
        ),
      );
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data == null) {
        debugPrint("Body: ${jsonDecode(resp.requestOptions.data.field)}");
      }
      log('resp >>>${resp.data}');

      debugPrint("************** Response End ************************");
      dynamic apiResp = resp.data;
      return apiResp;
    } on DioException catch (ex) {
      // nav.Get.to(MAErrorScreenWidget(onRetry: () {}));
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}");
      debugPrint("ResMethodType : [${ex.requestOptions.method}]");
      ex.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      ex.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(ex.requestOptions.queryParameters.toString());

      if (ex.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(ex.requestOptions.data)}");
      }
      log('error type >>>${ex.type}');
      debugPrint("************** Error End ************************");
      if (ex.type == DioExceptionType.connectionTimeout) {
        throw Exception(ex.message);
      } else {
        return ex;
      }
    }
  }

  Future<dynamic> customPatch(
    String path,
    String id, {
    data,
    baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.patch((baseUrl ?? generalurl) + path + id,
          data: data,
          options: Options(
            responseType: ResponseType.plain,
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${resp.requestOptions.data}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp = jsonDecode(resp.data);
      return apiResp;
    } on DioException catch (ex) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}");
      debugPrint("ResMethodType : [${ex.requestOptions.method}]");
      ex.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      ex.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(ex.requestOptions.queryParameters.toString());

      if (ex.requestOptions.data != null) {
        debugPrint("Body: ${ex.requestOptions.data}");
      }
      log('error type >>>${ex.type}');
      debugPrint("************** Error End ************************");
      if (ex.type == DioExceptionType.connectionTimeout) {
        throw Exception(ex.message);
      } else {
        return ex;
      }
    }
  }

  Future<dynamic> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceivedProgress}) async {
    try {
      Response resp = await _dio.post(baseUrl + path,
          queryParameters: queryParameters,
          data: data,
          options: Options(responseType: ResponseType.plain, headers: {
            Headers.contentTypeHeader: "application/json",
            if (App.token.isNotEmpty) "Authorization": "Bearer ${App.token}"
          }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("**************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      if (apiResp != null) {
        debugPrint("Response: ${jsonEncode(apiResp)}");
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(e.response?.statusMessage.toString());
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());
      if (e.response != null && e.response!.data != null) {
        Map<String, dynamic> errorData = json.decode(e.response!.data);
        debugPrint("errorData:$errorData");
        if (errorData.containsKey('non_field_errors') &&
            errorData['non_field_errors'] is List) {
          List<String> nonFieldErrors =
              errorData['non_field_errors'].cast<String>();
          debugPrint('Non-field errors: ${nonFieldErrors.join(', ')}');
        }
      }
      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());

      throw Exception(e.toString());
    }
  }

  Future<dynamic> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.put(baseUrl + path,
          data: data,
          options: Options(
            responseType: ResponseType.plain,
            //  headers:
            // {
            //   Headers.contentTypeHeader: "application/json",
            //   if(App.token.isNotEmpty)
            //   "Authorization": "Token ${App.user.token}"
            // }
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> get(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.get(baseUrl + path,
          queryParameters: queryParameters,
          data: data,
          options: Options(responseType: ResponseType.plain, headers: {
            "Content-Type": "application/json",
            if (App.token.isNotEmpty) "Authorization": "Bearer ${App.token}"
          }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        // ignore: avoid_print
        print(path);
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> testGet(
    String path, {
    data,
    headers,
    textBaseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.get(textBaseUrl ?? baseUrl + path,
          queryParameters: queryParameters,
          data: data,
          options: Options(
              responseType: ResponseType.plain,
              headers: headers ??
                  {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer ${App.token}"
                  }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = resp.data;
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        // ignore: avoid_print
        print(path);
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> customGet(
    String path, {
    data,
    baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.get((baseUrl ?? generalurl) + path,
          queryParameters: queryParameters, options: options
          //  Options(
          //    responseType: ResponseType.plain,
          //    headers: {
          //      "Content-Type": "application/json",
          //     "Authorization":"Bearer ${App.token}"
          //    }
          // )
          );
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = resp.data;
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        // ignore: avoid_print
        print(path);
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> delete(
    String path,
    String Id, {
    baseurl,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.delete((baseurl ?? baseUrl) + path + Id,
          options: Options(
            responseType: ResponseType.plain,
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      // dynamic apiResp;
      // if (resp.data.toString().isNotEmpty) {
      //   apiResp = jsonDecode(resp.data);
      // }
      // return apiResp;
      if (resp.statusCode == 204 || resp.statusCode == 200) {
        return 'success';
      } else {
        return 'failed';
      }
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        // ignore: avoid_print
        print("pathhhhhhhhhhh");
        // ignore: avoid_print
        print(path);
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> testDelete(
    String path,
    String Id, {
    headers,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.delete(generalurl + path + Id,
          options: Options(
            headers: headers,
            responseType: ResponseType.plain,
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      // dynamic apiResp;
      // if (resp.data.toString().isNotEmpty) {
      //   apiResp = jsonDecode(resp.data);
      // }
      // return apiResp;
      if (resp.statusCode == 204 || resp.statusCode == 200) {
        return 'success';
      } else {
        return 'failed';
      }
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        // ignore: avoid_print
        print("pathhhhhhhhhhh");
        // ignore: avoid_print
        print(path);
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> patch(
    String path,
    id, {
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.patch(baseUrl + path + id,
          data: data,
          options: Options(responseType: ResponseType.plain, headers: {
            "Content-Type": "application/json",
            if (App.token.isNotEmpty) "Authorization": "Bearer ${App.token}"
          }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> customPatches(
    String path,
    id, {
    required data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.patch(generalurl + path + id,
          data: data,
          options: Options(responseType: ResponseType.plain, headers: {
            "Content-Type": "application/json",
            if (App.token.isNotEmpty) "Authorization": "Bearer ${App.token}"
          }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> testPatches(
    String path,
    id, {
    required data,
    headers,
    testBaseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.patch(testBaseUrl + path + id,
          data: data,
          options: Options(
              responseType: ResponseType.plain,
              headers: headers ??
                  {
                    "Content-Type": "application/json",
                    if (App.token.isNotEmpty)
                      "Authorization": "Bearer ${App.token}"
                  }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<dynamic> customDelete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.delete(path,
          data: data,
          options: Options(
            responseType: ResponseType.plain,
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp = jsonDecode(resp.data);
      return apiResp;
    } on DioException catch (ex) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}");
      debugPrint("ResMethodType : [${ex.requestOptions.method}]");
      ex.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      ex.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(ex.requestOptions.queryParameters.toString());

      if (ex.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(ex.requestOptions.data)}");
      }
      log('error type >>>${ex.type}');
      debugPrint("************** Error End ************************");
      if (ex.type == DioExceptionType.connectionTimeout) {
        throw Exception(ex.message);
      } else {
        return ex;
      }
    }
  }

  Future<dynamic> fileUpload(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceivedProgress,
  }) async {
    try {
      Response resp = await _dio.post(baseUrl + path,
          data: data,
          options: Options(
              responseType: ResponseType.plain,
              //headers: {"Content-Type": "multipart/form-data"}
              // Headers.contentTypeHeader: "application/json",

              headers: {
                Headers.contentTypeHeader: "multipart/form-data",
              }));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      // if (resp.requestOptions.data != null) {
      //   debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      // }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = jsonDecode(resp.data);
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());

      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      log('resp >>>${jsonEncode(e.requestOptions.data)}');
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  //========================================================>

  Future<dynamic> documentpost(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceivedProgress}) async {
    try {
      Response resp = await _dio.post(baseUrl + path,
          data: data,
          options: Options(
            responseType: ResponseType.bytes,
          ));
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      // log('resp >>>${resp.data}');
      debugPrint("**************** Response End ************************");
      dynamic apiResp;
      if (resp.data.toString().isNotEmpty) {
        apiResp = resp.data;
      }
      if (apiResp != null) {
        debugPrint("Response: ${jsonEncode(apiResp)}");
      }
      return apiResp;
    } on DioException catch (e) {
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(e.response?.statusMessage.toString());
      debugPrint(
          "REQUEST[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}");
      debugPrint("ResMethodType : [${e.requestOptions.method}]");
      e.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      e.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(e.requestOptions.queryParameters.toString());
      if (e.response != null && e.response!.data != null) {
        Map<String, dynamic> errorData = json.decode(e.response!.data);
        debugPrint("errorData:$errorData");
        if (errorData.containsKey('non_field_errors') &&
            errorData['non_field_errors'] is List) {
          List<String> nonFieldErrors =
              errorData['non_field_errors'].cast<String>();
          debugPrint('Non-field errors: ${nonFieldErrors.join(', ')}');
        }
      }
      if (e.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(e.requestOptions.data)}");
      }
      debugPrint("************** Error End ************************");
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('No proper response from server');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timed-out. Check internet connection.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to connect to the server');
      }
      if (e.type == DioExceptionType.unknown) {
        throw Exception('Something went wrong with server communication');
      }
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
