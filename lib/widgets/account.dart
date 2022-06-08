import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget(
      {Key? key, required this.images, required this.name, required this.email})
      : super(key: key);
  final String images;
  final String name;
  final String email;
  @override
  Widget build(BuildContext context) {
    Widget sizes = const SizedBox(
      height: 10,
    );
    return Column(
      children: [
        sizes,
        CircleAvatar(
          backgroundImage: NetworkImage(images),
          radius: 40,
        ),
        sizes,
        Text(
          name,
          style: const TextStyle(
              fontSize: 20, fontFamily: "Roboto", color: Color(0xFF015C8F)),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          email,
          style: const TextStyle(
              fontSize: 12, fontFamily: "Roboto", color: Color(0xFF202832)),
        ),
      ],
    );
  }
}
