import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:minhtu/helper/storage_helper.dart';

class AuthController extends GetxController {
  String? cookie;
  bool isLogin = false;
  void setAuth(String cookie) {
    this.cookie = cookie;
    update();
  }

  void setAuthLocal(String cookie) {
    this.cookie = cookie;
    StorageHelper.setAuth(
      cookie: cookie,
    );
    update();
  }

  void checkAuth() async {
    cookie = await StorageHelper.getAuth();
    if (cookie != null) {
      isLogin = true;
    } else {
      isLogin = false;
    }
    update();
  }

  @override
  void onInit() {
    checkAuth();
    super.onInit();
  }

  void resetVariable() {
    cookie = null;
  }
}
