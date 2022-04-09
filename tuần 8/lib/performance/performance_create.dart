import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messenger/constants/constants.dart';

import '../forgot_password/verify_account.dart';

class Performance_create {
  static Future<void> addUser(CollectionReference users, String fullname,
      String email, String phone, String pass, int age) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(email)
        .set({
          'full_name': fullname, // John Doe
          'email': email,
          'phone': phone, // Stokes and Sons
          'age': age,
          'pass': pass
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> UpUsers(
      CollectionReference users, String email, String newPass) {
    return users
        .doc(email)
        .update({'pass': newPass})
        .then((value) => print('Update Completed'))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> checkIfLikedOrNot(
      CollectionReference users, BuildContext context, String email) async {
    return users.doc(email).get().then((DocumentSnapshot documentSnapshot) {
      ds_bool = documentSnapshot.exists;
      if (documentSnapshot.exists) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Verify(
                      email: email,
                    )));
      }
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
