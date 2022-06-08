import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool enableBack;
  const AppBarWidget(this.title, {Key? key, this.enableBack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/appbar.png"),
        Positioned(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          bottom: 10,
          left: 10,
          right: 10,
        ),
        if (enableBack)
          Positioned(
            bottom: 10,
            left: 28,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                "assets/svg/back.svg",
                color: Colors.white,
                width: 11,
                height: 18,
              ),
            ),
          )
      ],
    );
  }
}
