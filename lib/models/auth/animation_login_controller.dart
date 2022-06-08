import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhtu/utils/colors.dart';

class AnimationLoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation? tagOnFadeAnimation;
  Animation? tagOnScaleAnimation;
  Animation? tagOnTransitionAnimation;
  Animation? tagOnColorAnimation;
  Animation? formFadeAnimation;
  Animation? splashColorAnimation;

  AnimationController? tagOnLogoAnimationController;
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
}
