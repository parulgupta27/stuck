
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/widgets/RoundedButton.dart';
import 'package:stuck/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
 final emailController=TextEditingController();
 final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            SizedBox(
              width: screensize.width*0.8,
                child: CustomTextField(emailController,"Enter Email", Icons.email_outlined, false)),
            SizedBox(height: 30,),
            RoundedButton(Text("Forgot"),(){
              auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                Utils().showSnackBar(context: context, content:"We Have sent an Email for Recover Your Password");
              }).onError((error, stackTrace) {
                Utils().showSnackBar(context: context, content:error.toString());
              });
            },Colors.blue),
          ],
        ),
      ),
    );
      
  }
}
