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
      appBar: AppBar(title: Text("User Login"),
        backgroundColor: Colors.indigo.shade500,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       // color: Colors.indigo.shade200,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(height:50,),
                Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/Images/boy1.png'),
                    radius: 50,
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  child:TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text("Enter Email here"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 5
                        ),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Email is Required";
                      }

                    },
                  ),
                  ),
                SizedBox(height: 30,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.7,
                  child:TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter Password here"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.red,
                            width: 5
                        ),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password is Required";
                      }

                    },
                  ),
                ),
                SizedBox(height: 30,),
                OutlinedButton(onPressed: ()async{
                  if(_formkey.currentState!.validate())
                    {
                     String res=await AuthMethod().signInUser(emailController.text, passwordController.text);
                     Utils().showSnackBar(context: context, content: res);
                    }
                }, child:Text("Login"),
                style: OutlinedButton.styleFrom(primary: Colors.white,backgroundColor: Colors.blue),),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
