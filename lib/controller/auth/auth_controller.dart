import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:minhtu/helper/storage_helper.dart';
import 'package:minhtu/models/auth/login_model.dart';

class AuthController extends GetxController {
  AuthModel? authModel;
  bool isLogin = false;
  void setAuth(AuthModel authModel) {
    this.authModel = authModel;
    update();
  }

  void setAuthLocal(AuthModel authModel) {
    this.authModel = authModel;
    StorageHelper.setAuth(
      authModel: authModel,
    );
    update();
  }

  void checkAuth() async {
    authModel = await StorageHelper.getAuth();
    if (authModel != null) {
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
    authModel = null;
  }
}
