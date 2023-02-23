import '../models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Storage{
  final _firestore=FirebaseFirestore.instance;
  saveUserInfo({required String name,required String email,required String roll_no,required String department,required String branch,required String course,required String gender,required String relationship_status,required String year})async{
  User user=User(name: name, email: email, roll_no: roll_no, department: department, branch: branch, course: course, gender: gender, relationship_status: relationship_status, year: year);
  var ref=await _firestore.collection("Kurukshetra University").doc(department).collection(course).doc(branch).collection(year).doc(roll_no);
  await ref.set(user.toObj()).then((value) => {
    print("success"),
  }).onError((error, stackTrace) => {
    print(error),
  });
  }
}