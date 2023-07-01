import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/colors/colors.dart';

class LoginTextField extends StatelessWidget {
  final onChanged;
  final bool isPasswordField;
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  const LoginTextField(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.isPasswordField,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50)),
        child: TextField(
          onChanged: onChanged,
          obscureText: isPasswordField,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Utils.mainThemeColor),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hintText,
          ),
          controller: controller,
          style: GoogleFonts.roboto(fontSize: 16),
        ));
  }

}

