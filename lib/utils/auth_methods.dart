import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
class AuthMethod {
final _auth=FirebaseAuth.instance;
final _firestore=FirebaseFirestore.instance;
final _storage=FirebaseStorage.instance;
final _picker=ImagePicker();
signUpUser(String email,String password,String name,Uint8List img)async{
  if(email.length==0||password.length==0||name.length==0||img==null)return;
var credentials=await _auth.createUserWithEmailAndPassword(email: email, password: password);
User? user=credentials.user;
await user!.updateDisplayName(name);
await user.sendEmailVerification();
var ref=await _storage.ref("profilepics").child(user.uid);
await ref.putData(img);
String url=await ref.getDownloadURL();
var refernece=await _firestore.collection("users").doc(user.uid);
refernece.set({
  "name":name,
  "id":user.uid,
  "email":email,
  "profilepicUrl":url,
});
}
signInUser(String email,String password)async{
  if(email.length==0||password.length==0)return;
var credentials=await _auth.signInWithEmailAndPassword(email: email, password: password);
User? user=credentials.user;
if(!user!.emailVerified){
  await user.sendEmailVerification();
}
}
getUserImage()async{
  var file=await _picker.pickImage(source: ImageSource.gallery);
  return file!.readAsBytes();
}
}