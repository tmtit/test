import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhtu/repositories/auth_repository.dart';
import 'package:minhtu/routes/routes.dart';
import 'package:minhtu/utils/colors.dart';
import 'package:minhtu/utils/strings.dart';
import 'package:minhtu/widgets/loading_widget.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation? tagOnFadeAnimation;
  Animation? tagOnScaleAnimation;
  Animation? tagOnTransitionAnimation;
  Animation? tagOnColorAnimation;
  Animation? formFadeAnimation;
  Animation? splashColorAnimation;

  AnimationController? tagOnLogoAnimationController;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassWord = true;
  bool isChecked = false;

  @override
  void onInit() {
    super.onInit();
    tagOnLogoAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    splashColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: const Color(0xff192434).withOpacity(0.5),
    ).animate(
      CurvedAnimation(
        parent: tagOnLogoAnimationController!,
        curve: const Interval(
          0.0,
          0.4,
          curve: Curves.ease,
        ),
      ),
    );
    tagOnFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: tagOnLogoAnimationController!,
        curve: const Interval(
          0.0,
          0.4,
          curve: Curves.ease,
        ),
      ),
    );
    tagOnScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: tagOnLogoAnimationController!,
        curve: const Interval(
          0.0,
          0.4,
          curve: Curves.ease,
        ),
      ),
    );
    tagOnTransitionAnimation = Tween<double>(
      begin: Get.height / 2 - 20.5,
      end: Get.height / 5,
    ).animate(
      CurvedAnimation(
        parent: tagOnLogoAnimationController!,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    tagOnColorAnimation = ColorTween(
      begin: Colors.white,
      end: ColorUtils.primary,
    ).animate(
      CurvedAnimation(
        parent: tagOnLogoAnimationController!,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    formFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: tagOnLogoAnimationController!,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    tagOnLogoAnimationController!.forward();
    // checkInternet();
  }

  void apiLogin() async {
    if (formKey.currentState!.validate()) {
      Get.dialog(const LoadingWidget());
      bool result = await AuthRepository.login(
        username: usernameController.text,
        password: passwordController.text,
        rememberMe: isChecked,
      );
      if (result) {
        Get.offAllNamed(Routes.INITIAL);
      } else {
        Get.back();
        Get.snackbar("Lỗi", "Sai tên đăng nhập hoặc mật khẩu");
      }
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void updateHide() {
    if (hidePassWord == false) {
      hidePassWord = true;
      update();
    } else {
      hidePassWord = false;
      update();
    }
  }

  void updateIsChecked() {
    isChecked = !isChecked;
    update();
  }

  String? validateUserName(String? value) {
    if (GetUtils.isNullOrBlank(value)!) {
      return StringUtils.not_enter_username_yet.tr;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (GetUtils.isNullOrBlank(value)!) {
      return StringUtils.not_enter_password_yet.tr;
    }
    return null;
  }
}
