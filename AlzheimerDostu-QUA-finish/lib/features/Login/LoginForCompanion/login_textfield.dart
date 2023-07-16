import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../styles/colors/colors.dart';


class LoginTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const LoginTextField({
    required this.icon,
    required this.hintText,
    required this.isPasswordField,
    required this.controller,
    this.onChanged,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
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
          contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: hintText,
        ),
        controller: controller,
        style: GoogleFonts.roboto(fontSize: 16),
        validator: validator,
        onSaved: onSaved != null
            ? (value) => onSaved!(value)
            : null, // onSaved parametresi null değilse, değeri onSaved fonksiyonuna iletmek için bir lambda ifadesi kullanılır
      ),
    );
  }
}
