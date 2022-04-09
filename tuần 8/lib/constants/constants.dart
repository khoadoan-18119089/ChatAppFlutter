import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController emailContronller = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController PhoneController = TextEditingController();

TextEditingController Last_NameContronller = TextEditingController();
TextEditingController First_NameController = TextEditingController();

enum Color_Button {
  Activity,
  Inactivity,
}
enum Sign_in_up {
  sign_in,
  sign_up,
}
enum True_False {
  True,
  False,
  Null,
}
enum Value_Key {
  Valuable,
  Null,
}

String message = '';
String? Fullname, email, phone, pass;
int? age;

True_False true_falseEmail = True_False.Null;
True_False true_falsePass = True_False.False;
Value_Key value_key = Value_Key.Null;
RegExp regex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|((gmail+\.)+com))$');
bool Value1 = false;
bool Value2 = false;
FirebaseFirestore firestore = FirebaseFirestore.instance;
EmailAuth emailAuth = new EmailAuth(sessionName: 'Messenger');
bool? ds_bool;
