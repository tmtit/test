// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:minhtu/controller/auth/auth_controller.dart';
import 'package:minhtu/helper/storage_helper.dart';
import 'package:minhtu/routes/routes.dart';
import 'package:minhtu/utils/urls.dart';

class ApiBaseHelper extends GetConnect {
  static AuthController authController = Get.find();

  static Map<String, String> getDefaultHeader() {
    return {
      'Content-type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': authController.authModel?.idToken != null
          ? "Bearer ${authController.authModel?.idToken}"
          : "",
    };
  }

  static Map<String, String> getFromDataDefaultHeader() {
    return {
      'Content-type': 'multipart/form-data;charset=UTF-8',
      'Authorization': authController.authModel?.idToken != null
          ? "Bearer ${authController.authModel?.idToken}"
          : "",
    };
  }

  static Map<String, String> getRefreshedHeader() {
    return {
      'Content-type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': authController.authModel?.idToken != null
          ? "Bearer ${authController.authModel?.idToken}"
          : "",
    };
  }

  Future<Response?> getData({
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    required String url,
  }) async {
    print(UrlUtils.urlConnect(url));
    print(params);
    print(getDefaultHeader().toString());
    return performRequest(
      (Map<String, String> refreshedHeaders) {
        return get(
          UrlUtils.urlConnect(url),
          headers: headers ?? getDefaultHeader(),
          query: params ?? {},
        );
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
        return post(
          UrlUtils.urlConnect(url),
          body ?? {},
          headers: headers ?? getDefaultHeader(),
          query: params ?? {},
        );
      },
      headers: headers ?? getDefaultHeader(),
    );
  }

  Future<Response?> postFormData({
    List<int>? image,
    required String url,
    Map<String, String>? headers,
  }) async {
    print(UrlUtils.urlConnect(url));
    print(getDefaultHeader().toString());
    final form = FormData({
      if (image != null) 'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return performRequest(
      (Map<String, String> refreshedHeaders) {
        return request(
          UrlUtils.urlConnect(url),
          "GET",
          headers: headers ?? getDefaultHeader(),
        );
      },
      headers: headers ?? getDefaultHeader(),
    );
  }

  Future<Response?> putData({
    required String url,
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
  }) async {
    print(UrlUtils.urlConnect(url));
    print("body:" + body.toString());
    print(getDefaultHeader().toString());
    return performRequest(
      (Map<String, String> refreshedHeaders) {
        return put(
          UrlUtils.urlConnect(url),
          body ?? {},
          headers: headers ?? getDefaultHeader(),
          query: params ?? {},
        );
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
