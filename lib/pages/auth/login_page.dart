import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhtu/controller/auth/login_controller.dart';
import 'package:minhtu/utils/colors.dart';
import 'package:minhtu/utils/icons.dart';
import 'package:minhtu/utils/strings.dart';
import 'package:minhtu/widgets/buttons.dart';
import 'package:minhtu/widgets/round_checkbox_widget.dart';
import 'package:minhtu/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController controller) => GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Stack(
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Image.asset(
                  IconUtils.bgSplash,
                  fit: BoxFit.fill,
                ),
              ),
              AnimatedBuilder(
                animation: controller.tagOnLogoAnimationController!,
                builder: (context, child) => Container(
                  color: controller.splashColorAnimation!.value,
                ),
              ),
              AnimatedBuilder(
                animation: controller.tagOnLogoAnimationController!,
                builder: (contextAnimation, child) => Positioned(
                  bottom: 0,
                  child: Opacity(
                    opacity: controller.formFadeAnimation!.value,
                    child: Container(
                      height: Get.height * 0.9,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(
                            Get.width / 2,
                            Get.height / 4,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Form(
                        key: _loginController.formKey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.25,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom >
                                              30
                                          ? 100
                                          : 0),
                                  child: Column(
                                    children: [
                                      _userNameField(),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      _passwordField(),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              RoundCheckBoxWidget(
                                                  width: 20,
                                                  height: 20,
                                                  onChange: (bool? value) {
                                                    controller
                                                        .updateIsChecked();
                                                  },
                                                  value: controller.isChecked),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                StringUtils.remember_me.tr,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: ColorUtils.primary,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            child: Text(
                                              StringUtils.forgot_password.tr,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorUtils.primary),
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Center(
                                        child: ButtonWidget(
                                          title: StringUtils.sign_in.tr,
                                          height: 40,
                                          onTap: controller.apiLogin,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Center(
                                        child: RichText(
                                          text: TextSpan(
                                              text: StringUtils
                                                  .dont_have_an_account.tr,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff202832),
                                              ),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        " ${StringUtils.sign_up.tr}",
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: ColorUtils.primary,
                                                    ),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Get.snackbar(
                                                                "Đang phát triển",
                                                                "Tính năng đang phát triển");
                                                          }),
                                              ]),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                  animation: controller.tagOnLogoAnimationController!,
                  builder: (_, child) {
                    return Positioned(
                      left: 0,
                      right: 0,
                      top: controller.tagOnTransitionAnimation!.value -
                          MediaQuery.of(context).viewInsets.bottom,
                      child: Transform.scale(
                        scale: controller.tagOnScaleAnimation!.value,
                        child: Opacity(
                          opacity: controller.tagOnFadeAnimation!.value,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userNameField() {
    return TextFieldWidget(
      title: StringUtils.username.tr,
      controller: _loginController.usernameController,
      hintText: "0123456789",
      isRequired: true,
      validator: _loginController.validateUserName,
    );
  }

  Widget _passwordField() {
    return TextFieldWidget(
      controller: _loginController.passwordController,
      obscureText: _loginController.hidePassWord,
      title: StringUtils.password.tr,
      hintText: "* * * * * *",
      isRequired: true,
      validator: _loginController.validatePassword,
    );
  }
}
