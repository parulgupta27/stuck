import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:stuck/screens/LoginScreen.dart';
import 'package:stuck/screens/UserDetailScreen.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/utils/auth_methods.dart';
import 'package:stuck/utils/storage_method.dart';
import 'package:stuck/widgets/custom_text_field.dart';
import '../models/user_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  bool _isLoading=false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  Uint8List? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Stack(
                  children: [
                    image==null?
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 40,
                      backgroundImage: AssetImage('assets/Images/boy1.png'),
                    ):CircleAvatar(
                      radius: 40,
                      backgroundImage: MemoryImage(image!),
                    ),
                    Positioned(
                      top: 45,
                      left: 50,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      top:37,
                        left:42,
                        child: IconButton(
                            onPressed: () async{
                              image=await AuthMethod().getUserImage();
                              setState(() {
                                
                              });
                            },
                            icon: Icon(Icons.camera_alt_outlined,color: Colors.grey,size: 17,),),),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  height: screensize.height*0.423,
                  width: screensize.width*0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        CustomTextField(
                            _nameController,
                            "Enter Your Name",
                            Icons.supervised_user_circle,
                            false),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            _emailController,
                            "Enter Your Email",
                            Icons.email_outlined,
                            false),

                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            _passwordController,
                            "Enter Your Password",
                            Icons.security,
                            true),

                        SizedBox(height: 20,),
                        SizedBox(
                        width: screensize.width*0.7,
                            height: 40,
                            child: ElevatedButton(onPressed: ()async{
                              if(_emailController.text.contains("@kuk.ac.in")){
                                _isLoading=true;
                                setState(() {
                                  
                                });
                              String res=await AuthMethod().signUpUser(_emailController.text, _passwordController.text,_nameController.text, image!);
                              print(res);
                              if(res=="Success"){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserDetailPage()));
                              }
                              _isLoading=false;
                              setState(() {
                                
                              });
                              }
                              else{
                                
                              }
                            }, child:_isLoading? CircularProgressIndicator(color: Colors.white,): Text("Sign Up"),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(child: Container(height: 1,color: Colors.grey,)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Already Have An Account?"),
                    ),
                    Expanded(child: Container(height: 1,color: Colors.grey,)),
                  ],
                ),
                SizedBox(height: 30,),

                SizedBox(
                    width: screensize.width*0.7,
                    height: 40,
                    child: ElevatedButton(onPressed: ()
                    {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    }, child:const Text("User Login"),)),

              ],
            ),
        ),
      ),
          )),
    );
  }
}

/*
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

 */
