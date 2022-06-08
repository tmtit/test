import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VoiceWidget extends StatelessWidget {
  const VoiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFF015C8F),
      radius: 16,
      child: SvgPicture.asset("assets/images/voice.svg"),
    );
  }
}
