import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var firestore=FirebaseFirestore.instance;
  String? img;
  getImage()async{
    var ref=await firestore.collection("students").doc("252002104").get() ;
  var info=ref.get("url");
 img= info.toString();
 print(img);
  setState(() {
    
  });
  }
  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
    // getImage();
    print(9999999999999-DateTime.now().millisecondsSinceEpoch);
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Scaffold(
      body: Column(children: [
       SizedBox(height: height*0.01,) ,
       Container(
         height: 100,
         width: 100,
       child:img==null?Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDgU-uGLjc8B0BTeVO0NvI4qAqZNp2qCU7gg&usqp=CAU"):Image.network(img!),
    )]),   
    );
  }
}