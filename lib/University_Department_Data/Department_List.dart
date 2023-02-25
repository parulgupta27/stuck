/*
 final List<String> department=["UIET","Law Department","Commerce Department"];
final List<String> uietcourse=["BTech","MTech"];
final List<String> lawcourse=["Bachelor In Law","Master In Law","Ph.D"];
final List<String> commercecourse=["M.Phil","Master In Commerce"];
final List<String> btecbranch=["CSE","ECE","BT","ME","EIE"];
final List<String> mtecbranch=["CSE","ECE","BT","ME","EE","ME Production","Me Thermal","DT"];
final List<String> blawcourse=["LL.B"];
final List<String> mlawcourse=["LL.M"];
final List<String> phdlawcourse=["Ph.D(Law)"];
final List<String> mphilcommercecourse=["M Phil(Commerce)"];
final List<String> mastercommercecourse=["M.Com"];
String? selected_dept;
String? selected_course;
String? selected_branch;
List<String> course=[];
List<String> branch=[];
 DropdownButtonFormField<String>(
 hint: Text("- Select Course -"),
 value: selectedCourse,
 items:selectedDepartment==""?departmentToCourse[selectedDepartment]!.map((e){
 return DropdownMenuItem<String>
 (child: Text(e),value: e,);
 }).toList():[], onChanged: (val){
 selectedCourse=val.toString();
 setState(() {
 });
 }),
 SizedBox(height: 10,),
 DropdownButtonFormField<String>(
 hint: Text("- Select branch -"),
 value: selectedBranch,
 items:selectedBranch==""?courseToBranch[selectedCourse]!.map((e){
 return DropdownMenuItem<String>
 (child: Text(e),value: e,);
 }).toList():[], onChanged: (val){
 selectedBranch=val.toString();
 setState(() {
 });
 })
 */

final List<String> department=[
  "University Institute of Engineering & Technology",
  "Department of Law",
  "Department of Commerce",

];

Map<String,List<String>>departmentToCourse={
  "University Institute of Engineering & Technology":["BTech","MTech"],
   "Department of Law":["Bachelor In Law","Master In Law","Ph.D"],
   "Department of Commerce":["M.Phil","Master In Commerce"],
};
Map<String,List<String>>courseToBranch={
  "BTech":["CSE","ECE","BT","ME"],
  "MTech":["CSE","ECE","BT","ME","EE","ME Production","Me Thermal","DT"],

  "Bachelor In Law":["LL.B"],
  "Master In Law":["LL.M"],
  "Ph.D":["Ph.D(Law)"],

  "M.Phil":["M Phil(Commerce)"],
  "Master In Commerce":["M.Com"]

};


List<String> genter=['Male','Female','Others'];

List<String> graduationyear=['2023','2024','2025','2026','2027','2028','2029','2030'];
