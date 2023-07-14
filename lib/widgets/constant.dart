import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

void goTo(BuildContext context, Widget nextScreen) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextScreen,
      ));
}

dialogueBox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}

Widget progressIndicator(BuildContext context) {
  return Center(
      child: CircularProgressIndicator(
        backgroundColor: Utils.mainThemeColor,
        color: Utils.mainThemeColor,
        strokeWidth: 7,
      ));
}