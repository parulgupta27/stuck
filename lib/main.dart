import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/screens/signup_screen.dart';
late double height;
late double width;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomTabScreen(),
  ));
}

