import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:stuck/utils/auth_methods.dart';
import 'package:stuck/utils/storage_method.dart';
import '../models/user_model.dart';
//hello 
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _nameController=TextEditingController();
  Uint8List? image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Storage().saveUserInfo(name: "Sushant", email: "sushantrana@gmail.com", roll_no: "252002103", department: "UIET", branch: "CSE", course: "BTech", gender: "Male", relationship_status: "Single", year: '2024');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: image==null?CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/21/21104.png"),
                    
                    backgroundColor: Colors.amber,
                    radius: 40,
                  ):CircleAvatar(
                   radius: 40,
                   backgroundImage: MemoryImage(image!),
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: Positioned(
                    bottom: 5,
                    right: 5,
                    child: IconButton(onPressed: ()async{
                      image=await AuthMethod().getUserImage();
                      setState(() {
                        
                      });
                    }, icon: Icon(Icons.add)),),
                ),
              ],
            ),
            SizedBox(height: 30,),
            TextField(
              controller: _nameController,
            ),
            TextField(
              controller: _emailController,
            ),
            TextField(
              controller: _passwordController,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: ()async{
              var res=await AuthMethod().signUpUser(_emailController.text, _passwordController.text, _nameController.text, image!);
           print(res);
            }, child: Text("Sign In"),),
          ],),
        ),
      )),
    );
  }
}