

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/widgets/constant.dart';
import 'package:ff_55/styles/colors/colors.dart';

import 'package:flutter/material.dart';

import 'Single_Message.dart';
import 'message_textfield.dart';
class ChatScreen extends StatefulWidget {
  final String currentUserId;
  //final String friendMail;
  final String friendName;

  const ChatScreen(
      {super.key,
        required this.currentUserId,
        //required this.friendMail,
        required this.friendName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? type;
  String? myname;

  getStatus() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.currentUserId)
        .get()
        .then((value) {
      setState(() {
        type = value.data()!['type'];

        myname = value.data()!['name'];
      });
    });
  }

  @override
  void initState() {
    getStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Utils.mainThemeColor,
          title: Text(widget.friendName),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.currentUserId)
                    .collection('messages')
                    .doc(widget.friendName)
                    .collection('chats')
                    .orderBy('date', descending: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.length < 1) {
                      return Center(
                        child: Text(
                          type == "hasta_yakını"
                              ? "Hasta İle Konuş"
                              : "Hasta Bakıcısıyla Konuş",
                          style: TextStyle(fontSize: 30),
                        ),
                      );
                    }
                    return Container(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          bool isMe = snapshot.data!.docs[index]['senderId'] ==
                              widget.currentUserId;
                          final data = snapshot.data!.docs[index];
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) async {
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.currentUserId)
                                  .collection('messages')
                                  .doc(widget.friendName)
                                  .collection('chats')
                                  .doc(data.id)
                                  .delete();

                            },
                            child: SingleMessage(
                              message: data['message'],

                              isMe: isMe,
                              friendName: widget.friendName,
                              myName: myname,
                              type: data['type'],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return progressIndicator(context);
                },
              ),
            ),
            MessageTextField(
              currentId: widget.currentUserId,
              friendName: widget.friendName,
            ),
          ],
        ));
  }
}