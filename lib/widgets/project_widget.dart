import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'center_voice_widget.dart';

class ProjectWidget extends StatelessWidget {
  ProjectWidget(
      {Key? key,
      required this.name,
      required this.date,
      required this.status,
      required this.income,
      required this.onTap})
      : super(key: key);
  final Function onTap;
final String name;
  final String date;
  final String status;
  final String income;
  final Widget sizes = SizedBox(height: Get.height * 0.01);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: Get.height * 0.2,
        width: Get.width * 0.9,
        child: DecoratedBox(
          decoration: BoxDecoration(

            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(162, 162, 162, 0.25),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 8),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFFBFDFF),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CenterVoiceWidget(
                  center: false,
                  name: name,
                  date: date,
                ),
                sizes,
                RichText(
                    text: TextSpan(
                        // text: "Status:",

                        children: <TextSpan>[
                      const TextSpan(
                          text: "Status: ",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF77828F),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: status,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF3DA818),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400)),
                    ])),
                sizes,
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: "Income: ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF77828F),
                          fontFamily: "Roboto")),
                  TextSpan(
                      text: income,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF202832),
                          fontFamily: "Roboto")),
                  const TextSpan(
                      text: " đ",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF202832),
                          fontFamily: "Roboto")),
                ])),
              ],
            ),
          ),
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
