
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class SingleMessage extends StatelessWidget {
  final String? message;
  final bool? isMe;

  final String? type;
  final String? friendName;
  final String? myName;


  const SingleMessage(
      {super.key,
        this.message,
        this.isMe,

        this.type,
        this.friendName,
        this.myName,
      });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return type == "text"
        ? Container(
      constraints: BoxConstraints(
        maxWidth: size.width / 2,
      ),
      alignment: isMe! ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
            color: isMe! ? Utils.mainThemeColor : Colors.black,
            borderRadius: isMe!
                ? BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )
                : BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxWidth: size.width / 2,
          ),
          alignment: isMe! ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    isMe! ? myName! : friendName!,
                    style: TextStyle(fontSize: 15, color: Colors.white70),
                  )),
              Divider(),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    message!,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
              Divider(),

            ],
          )),
    )
        : type == 'img'
        ? Container(
      height: size.height / 2.5,
      width: size.width,
      // constraints: BoxConstraints(
      //   maxWidth: size.width / 2,
      // ),
      alignment: isMe! ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Container(
          height: size.height / 2.5,
          width: size.width,
          decoration: BoxDecoration(
            color: isMe! ? Colors.pink : Colors.black,
            borderRadius: isMe!
                ? BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )
                : BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          // padding: EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxWidth: size.width / 2,
          ),
          alignment:
          isMe! ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    isMe! ? myName! : friendName!,
                    style: TextStyle(
                        fontSize: 15, color: Colors.white70),
                  )),

              Divider(),

            ],
          )),
    )
        : Container(
      constraints: BoxConstraints(
        maxWidth: size.width / 2,
      ),
      alignment: isMe! ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
            color: isMe! ? Colors.pink : Colors.black,
            borderRadius: isMe!
                ? BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )
                : BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxWidth: size.width / 2,
          ),
          alignment:
          isMe! ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    isMe! ? myName! : friendName!,
                    style: TextStyle(
                        fontSize: 15, color: Colors.white70),
                  )),

              Divider(),

            ],
          )),
    );
  }
}