import 'package:cloud_firestore/cloud_firestore.dart';
class User {
  String? bio;
  String? url;
  String? name;
  String? email;
  String? roll_no;
  String? department;
  String? branch;
  String? course;
  String? year;
  String? gender;
  String? phoneNo;
  User(
      {this.bio,
         this.url,
        this.name,
      this.email,
       this.roll_no,
       this.department,
       this.branch,
      this.course,
      this.gender,
       this.phoneNo,
      this.year});
  toObj() {
    return {
      "name": name,
      "email": email,
      "roll_no": roll_no,
      "department": department,
      "branch": branch,
      "course": course,
      "url":url,
      "year": year,
      "gender": gender,
      "phoneNo": phoneNo,
      "bio":bio
    };
  }
  fromObj(DocumentSnapshot<Map<String,dynamic>>user){
  bio=user.get("bio");
  url=user.get("url");
  name=user.get("name");
  email=user.get("email");
  roll_no=user.get("roll_no");
  department=user.get("department");
  branch=user.get("branch");
  course=user.get("course");
  year=user.get("year");
  gender=user.get("gender");
  phoneNo=user.get("phoneNo");
  }
}
