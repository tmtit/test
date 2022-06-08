import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance(
      {Key? key,
      required this.name,
      required this.price,
      required this.colorPrice,
      required this.detail})
      : super(key: key);
  final String name;
  final String price;
  final Color colorPrice;
  final String detail;

  @override
  Widget build(BuildContext context) {
    Widget sizes = const SizedBox(
      height: 12,
    );
    return SizedBox(
      width: Get.width * 0.9,
      height: Get.height * 0.17,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFFBFDFF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(162, 162, 162, 0.25),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 39, right: 39),
          child: Column(
            children: [
              sizes,
              Text(
                name,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Roboto",
                    color: Color(0xFF202832)),
              ),
              sizes,
              Text(
                price + " đ",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Roboto",
                  color: colorPrice,
                ),
              ),
              sizes,
              Text(
                detail,
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Roboto",
                    color: Color(0xFF202832)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
