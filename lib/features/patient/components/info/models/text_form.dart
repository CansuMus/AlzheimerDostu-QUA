import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String text;
  const TextForm({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Utils.mainThemeColor,
            ),
            padding: const EdgeInsets.all(10.0),
            child:  Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            style: const TextStyle(fontSize: 30),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "...",
            ),
          ),
        )
      ],
    );
  }
}