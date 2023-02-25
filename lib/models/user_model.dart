class User {
  String bio;
  String url;
  String name;
  String email;
  String roll_no;
  String department;
  String branch;
  String course;
  String year;
  String gender;
  String phoneNo;
  User(
      {required this.bio,
        required this.url,
        required this.name,
      required this.email,
      required this.roll_no,
      required this.department,
      required this.branch,
      required this.course,
      required this.gender,
      required this.phoneNo,
      required this.year});
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
}
