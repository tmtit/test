import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'voice_widget.dart';

class CenterVoiceWidget extends StatelessWidget {
  CenterVoiceWidget(
      {Key? key, required this.center, required this.name, required this.date})
      : super(key: key);
  final bool center;
  final String name;
  final String date;
  final Widget sizes = SizedBox(height: Get.height * 0.01);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: center ? Alignment.center : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const VoiceWidget(),
          sizes,
          Text(name),
          sizes,
          Text(
            date,
            style: const TextStyle(
                fontSize: 11,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                color: Color(0xFF347DA5)),
          ),
        ],
      ),
    );
  }
}
