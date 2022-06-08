// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:minhtu/controller/auth/auth_controller.dart';
import 'package:minhtu/helper/storage_helper.dart';
import 'package:minhtu/routes/routes.dart';
import 'package:minhtu/utils/urls.dart';

class ApiBaseHelper {
  ApiBaseHelper() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }

  static AuthController authController = Get.find();
  Dio dio = Dio();

  static Map<String, String> getDefaultHeader() {
    return {
      'Content-type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
      if (authController.cookie != null) 'Cookie': authController.cookie!,
    };
  }

  static Map<String, String> getRefreshedHeader() {
    return {
      'Content-type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
      if (authController.cookie != null) 'Cookie': authController.cookie!,
    };
  }

  Future<Response?> getData({
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    required String url,
  }) async {
    return performRequest(
      (Map<String, String> refreshedHeaders) {
        return dio.get(
            "https://rpc.freshdi.com/api/method/freshdi.data.test.batch.get_batch_detail",
            queryParameters: params,
            options:
                Options(method: "GET", headers: headers ?? getDefaultHeader()));
      },
      headers: headers ?? getDefaultHeader(),
    );
  }

  Future<Response?> postData({
    required String url,
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    print(UrlUtils.urlConnect(url));
    print("params:" + params.toString());
    print("body:" + body.toString());
    print(getDefaultHeader().toString());
    return performRequest(
      (Map<String, String> refreshedHeaders) {
        return dio.post(UrlUtils.urlConnect(url),
            queryParameters: params ?? {},
            data: body ?? {},
            options: Options(
                method: "POST", headers: headers ?? getDefaultHeader()));
      },
      headers: headers ?? getDefaultHeader(),
    );
  }

  static Future<Response?> performRequest(
      Future<Response> Function(Map<String, String>) request,
      {Map<String, String>? headers}) async {
    try {
      Response response = await request(headers ?? getDefaultHeader());
      switch (response.statusCode) {
        case 401:
          if (Get.currentRoute != Routes.LOGIN_PAGE) {
            AuthController authController = Get.find();
            authController.resetVariable();
            await StorageHelper.clearLogin();
            Get.offAllNamed(Routes.LOGIN_PAGE);
            return null;
          }
          return response;
        case 403:
        // AuthController authController = Get.find();
        // authController.resetVariable();
        // await StorageHelper.clearLogin();
        // Get.offAllNamed(Routes.LOGIN_RULE_PAGE);
        // return null;
        default:
          return response;
      }
    } catch (exception) {
      return null;
    }
  }
}
