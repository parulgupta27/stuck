import 'dart:typed_data';
import '../models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Storage {
  final _firestore = FirebaseFirestore.instance;
  final _storage=FirebaseStorage.instance;
  String bio="";
  saveUserInfo(
      {required String url,
      required String name,
      required String email,
      required String roll_no,
      required String department,
      required String branch,
      required String course,
      required String gender,
      required String phoneNo,
      required String year}) async {
    if (name == "" ||
        name == "null" ||
        email == "null" ||
        phoneNo == "" ||
        roll_no == "" ||
        email == "" ||
        roll_no == "" ||
        department == "" ||
        branch == "" ||
        course == "" ||
        gender == "" ||
        phoneNo == "" ||
        year == "") {}
    User user = User(
        bio: bio,
        url: url,
        name: name,
        email: email,
        roll_no: roll_no,
        department: department,
        branch: branch,
        course: course,
        gender: gender,
        phoneNo: phoneNo,
        year: year);
    try {
      var ref = await _firestore
          .collection("Kurukshetra University")
          .doc(department)
          .collection(course)
          .doc(branch)
          .collection(year)
          .doc(roll_no);

      await ref.set(user.toObj());
      var students = await _firestore.collection("students").doc(email);
      await students.set(user.toObj());
      return "Success";
    } on FirebaseException catch (e) {
      return e.code;
    } catch (e) {
      return "Internal Error";
    }
  }
 uplaodPost(Uint8List image, User user,String caption)async{
   try{
  var time=99999999999999-DateTime.now().millisecondsSinceEpoch;
 var picref=_storage.ref("posts").child(time.toString());
 await picref.putData(image);
 String url=await picref.getDownloadURL();
 var ref= _firestore.collection("students").doc(user.email).collection("posts").doc(time.toString());
 await ref.set({
   "caption":caption,
   "roll_no":user.roll_no,
   "url":url,
   "id":time,
 });
 ref=_firestore.collection("posts").doc(time.toString());
 await ref.set({
   "caption":caption,
   "roll_no":user.roll_no,
   "url":url,
   "id":time,
 });
 return "Success";
 }
 on FirebaseException catch(e){
   return e.code;
 }
 catch(e){
return "Internal Error";
 }
 }
}
