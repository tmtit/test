import 'package:flutter/material.dart';
import 'package:minhtu/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final bool isRequired;
  final String? hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  const TextFieldWidget(
      {Key? key,
      required this.title,
      this.isRequired = false,
      this.hintText,
      this.obscureText = false,
      this.validator,
      required this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF77828F),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            if (isRequired)
              const Text(
                "*",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorUtils.errorColor,
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            isDense: true,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF0F296D),
              ),
              borderRadius: BorderRadius.zero,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF0F296D),
              ),
              borderRadius: BorderRadius.zero,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
          validator: validator,
          controller: controller,
        ),
      ],
    );
  }
}
