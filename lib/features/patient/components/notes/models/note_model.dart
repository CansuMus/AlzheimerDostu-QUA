import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String title;
  String body;

  Note({
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }
}
