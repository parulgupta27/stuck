class User{
  String name;
  String email;
  String roll_no;
  String department;
  String branch;
  String course;
  String year;
  String gender;
  String relationship_status;
  User({required this.name,required this.email,required this.roll_no,required this.department,required this.branch,required this.course,required this.gender,required this.relationship_status,required this.year});
  toObj(){
    return {
     "name":name,
     "email":email,
     "roll_no":roll_no,
     "department":department,
     "branch":branch,
     "course":course,
     "year":year,
     "gender":gender,
     "relationship_status":relationship_status
    };
  }
}