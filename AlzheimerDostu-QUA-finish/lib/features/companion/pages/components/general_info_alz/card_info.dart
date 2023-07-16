import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String title, text;
  const CardInfo({
    super.key, required this.title, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Utils.mainThemeColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white,fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
