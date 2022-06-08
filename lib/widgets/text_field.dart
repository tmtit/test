import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TextFields extends StatelessWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: TextFormField(
          decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search',
        hintStyle: const TextStyle(
            fontSize: 16, fontFamily: 'Roboto', color: Color(0xFF77828F)),
        suffixIcon: IconButton(
            onPressed: () {}, icon: SvgPicture.asset("assets/images/menu.svg")),
        prefixIcon: SvgPicture.asset(
          "assets/images/search.svg",
          fit: BoxFit.scaleDown,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black12, width: 2)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white),
        ),
      )),
    );
  }
}
