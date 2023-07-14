

import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

String? PATIENTID = "";

class FirebaseFunctions {


  static final FirebaseAuth _auth = FirebaseAuth.instance; 
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String? userId;



  static registrationAndCodeMaker(userEmail, userPassword) async {
     try {
                      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                        email: userEmail,
                        password: userPassword,
                      );


                        // Generate a unique code
                        String code = generateRandomCode();

                        await _firestore.doc("users/${userCredential.user!.uid}").set({
                          'role': 'caregiver',
                          'code': code,
                          "ID" : userCredential.user!.uid
                        });



                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    }

  }


  

    static generateRandomCode() {
  // Generate a random 6 digit code
  var random = Random();
  return random.nextInt(1000000).toString().padLeft(6, '0');
}


static patientCodeVerification (code, void function) async {

var usersDocuments = await _firestore.collection("users").get();

for (var document in usersDocuments.docs ){

  debugPrint(document.id.toString());
  var documentCode = document.data()["code"];

  if (documentCode == code ){
    userId = document.id;
    function;
  }
  else 
  debugPrint("Error");
    
} 

}



static Future<bool> checkCode(String code) async {
  final QuerySnapshot result = await _firestore
      .collection('users')
      .where('code', isEqualTo: code)
      .get();

  final List<DocumentSnapshot> documents = result.docs;

  if (documents.length == 1) {
    PATIENTID = documents[0].id;
    // code is valid, let the patient enter
    return true;
  } else {
    // code is not valid
    return false;
  }
}







  static _setLocationToFirestore() async {
    try {
      Location location = Location();

       LocationData locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('users').doc('ID').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

 static Future<void> _listenLocation() async {
    Location location = Location();
    StreamSubscription<LocationData>? _locationSubscription;

    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      
    }).listen((LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc(PATIENTID).set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
      }, SetOptions(merge: true));
    });
  }


   




}