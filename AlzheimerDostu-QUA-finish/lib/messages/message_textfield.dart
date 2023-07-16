import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';
class MessageTextField extends StatefulWidget {
  final String currentId;
  final String friendName;

  const MessageTextField(
      {super.key, required this.currentId, required this.friendName});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  TextEditingController _controller = TextEditingController();

  String? message;










  sendMessage(String message, String type) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.currentId)
        .collection('messages')
        .doc(widget.friendName)
        .collection('chats')
        .add({
      'senderId': widget.currentId,
      'receiverId': widget.friendName,
      'message': message,
      'type': type,
      'date': DateTime.now(),
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.friendName)
        .collection('messages')
        .doc(widget.currentId)
        .collection('chats')
        .add({
      'senderId': widget.currentId,
      'receiverId': widget.friendName,
      'message': message,
      'type': type,
      'date': DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Utils.mainThemeColor,
                controller: _controller,
                decoration: InputDecoration(
                    hintText: 'type your message',
                    fillColor: Colors.grey[100],
                    filled: true,
                    prefixIcon: IconButton(
                        onPressed: () {


                        },
                        icon: Icon(
                          Icons.add_box_rounded,
                          color: Utils.mainThemeColor,
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  message = _controller.text;
                  sendMessage(message!, 'text');
                  _controller.clear();
                },
                child: Icon(
                  Icons.send,
                  color: Utils.mainThemeColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  chatsIcon(IconData icons, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Utils.mainThemeColor,
            child: Icon(icons),
          ),
          Text("$title")
        ],
      ),
    );
  }
}