import '../models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Storage {
  final _firestore = FirebaseFirestore.instance;
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
      var students = await _firestore.collection("students").doc(roll_no);
      await students.set(user.toObj());
      return "Success";
    } on FirebaseException catch (e) {
      return e.code;
    } catch (e) {
      return "Internal Error";
    }
  }

  getUsers(CollectionReference ref) async {
    StreamBuilder<QuerySnapshot>(
      stream: ref.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.docs[index].get("name")),
                  );
                }),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: Colors.blueGrey),
          );
        }
      },
    );
  }
}
