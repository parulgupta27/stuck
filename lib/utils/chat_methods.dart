import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart' as umd;
class ChatMethods{
  final _auth=FirebaseAuth.instance;
  final _firestore=FirebaseFirestore.instance;

 getDoc(umd.User user,umd.User currUser){
String doc;
 if(int.parse(currUser.roll_no!)<int.parse(user.roll_no!)){
 doc=currUser.roll_no!+user.roll_no!;
 }
 else{
    doc=user.roll_no!+currUser.roll_no!;
 }
 return doc;
 }
 saveMessage(umd.User user,umd.User currUser,String message)async{
   try{
   await updateTimeStamps(user, currUser);
   String doc=getDoc(user, currUser);
  await FirebaseFirestore.instance.collection("chats").doc(doc).collection("messages").doc(DateTime.now().microsecondsSinceEpoch.toString()).set({
    "message":message,
    "sender":currUser.email!,
  });
  print("Success");
  }
  catch(e){
    print("error");
    print(e);
  }
 }
 updateTimeStamps(umd.User user,umd.User currUser)async{
 String timeStamp=(9999999999999999-DateTime.now().millisecondsSinceEpoch).toString();
 var ref= _firestore.collection("students").doc(user.email).collection("timestamps").doc(currUser.email);
 String ts="";
 try{
 var def=await ref.get();
 ts=def.get("timestamp");}
 catch(e){
   print(e);
 }
 await ref.set({
 "timestamp":timeStamp
 });
 ref=  _firestore.collection("students").doc(currUser.email).collection("timestamps").doc(user.email);
 await ref.set({"timestamp":timeStamp});
 var cef= _firestore.collection("students").doc(user.email).collection("chats");
 if(ts!="")
 await cef.doc(ts).delete();
 await cef.doc(timeStamp).set({"email":currUser.email});
cef= _firestore.collection("students").doc(currUser.email).collection("chats");
if(ts!="")
 await cef.doc(ts).delete();
 await cef.doc(timeStamp).set({"email":user.email});
 }
}