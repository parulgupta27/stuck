import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/utils/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
         child: Center(
           child: Column(
             children: [
               SizedBox(height: 30,),
               CircleAvatar(
                 backgroundColor: Colors.grey,
                 radius: 35,
                 child: CircleAvatar(
                   backgroundImage: AssetImage('assets/Images/boy1.png'),
                   radius: 32,
                 ),
               )
             ],
           ),
         ),
      ),
    );
  }
}
