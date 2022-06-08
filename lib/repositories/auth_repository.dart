
import 'package:get/get.dart';
import 'package:minhtu/controller/auth/auth_controller.dart';
import 'package:minhtu/helper/api_base.dart';
import 'package:minhtu/models/auth/login_model.dart';
import 'package:minhtu/utils/urls.dart';

class AuthRepository {
  static AuthController authController = Get.find();

  static Future<bool> login({
    String username = "",
    String password = "",
    bool rememberMe = false,
  }) async {
    // FirebaseMessaging firebaseMessaging = FirebaseMessaging();
    // String deviceToken = await firebaseMessaging.getToken();
    final result = await ApiBaseHelper().postData(
      url: UrlUtils.API_LOGIN,
      body: {
        "username": username.trim(),
        "password": password.trim(),
        "rememberMe": rememberMe,
      },
    );
    if (result != null && result.statusCode == 200) {
      AuthModel authModel = AuthModel.fromJson(
        result.body,
      );
      if (rememberMe) {
        authController.setAuthLocal(authModel);
      } else {
        authController.setAuth(authModel);
      }
      return true;
    } else {
      return false;
    }
  }

}
