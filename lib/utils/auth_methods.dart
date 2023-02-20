import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
class AuthMethod {
var _auth=FirebaseAuth.instance;
String? email;
String ?password;
String ?name;
XFile ?image;

}