import 'package:get/get.dart';
import 'package:minhtu/controller/auth/auth_controller.dart';
import 'package:minhtu/helper/api_base.dart';
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
        "usr": username.trim(),
        "pwd": password.trim(),
      },
    );
    if (result != null && result.statusCode == 200) {
      List<String>? listCookie = result.headers['set-cookie'];
      String cookie = listCookie!
          .map((element) {
            return element.split(";").first;
          })
          .toList()
          .join(";");
      if (rememberMe) {
        authController.setAuthLocal(cookie);
      } else {
        authController.setAuth(cookie);
      }
      return true;
    } else {
      return false;
    }
  }
}
