import 'package:flutter/material.dart';
import 'package:stuck/utils/auth_methods.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          ElevatedButton(onPressed: (){
            var img=AuthMethod().getUserImage();
            print(img);
          }, child: Text("Pick Image"))
        ],),
      )),
    );
  }
}