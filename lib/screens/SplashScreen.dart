import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stuck/screens/ForgotPasswordScreen.dart';
//import 'package:stuck/screens/HomeScreen.dart';
import 'package:stuck/screens/LoginScreen.dart';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/widgets/PostWidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
final auth=FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final user=auth.currentUser;

    if(user!=null)
      {
        Timer(const Duration(seconds: 5),(){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const BottomTabScreen(),));
        });
      }
    else
      {
        Timer(const Duration(seconds: 5),(){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>const LoginScreen(),));
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:SafeArea(child:
        Center(
          child: Image.asset("assets/Images/stuck.png",fit: BoxFit.cover,height: 130,width: 130,),
          ),
      
    ));
  }
}
