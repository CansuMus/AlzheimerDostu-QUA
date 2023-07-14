import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  const TextForm({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  String enteredValue = '';

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
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              style: const TextStyle(fontSize: 30),
              controller: widget.controller,
              onChanged: (value) {
                setState(() {
                  enteredValue = value;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: enteredValue.isNotEmpty ? enteredValue : '...',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
