import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/messages/chat_secreen.dart';


import 'package:ff_55/styles/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HastayaBildirim extends StatelessWidget {
  const HastayaBildirim({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Utils.mainThemeColor,
          title:Text("Hasta Seçiniz")

      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').where('hy_email',isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots(),

          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return  Center(
                child: CircularProgressIndicator(

                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context,int index){
                  final d=snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(



                      color: Utils.mainThemeColor,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(currentUserId:FirebaseAuth.instance.currentUser!.uid, friendName: d['friendName'])));
                        },

                        title: Padding(
                          padding:const EdgeInsets.all(8.0) ,

                          child: Text('Hastanız:'+d['friendName'],style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                      ),

                    ),
                  );
                }
            );
          }

      ),
    );
  }
}