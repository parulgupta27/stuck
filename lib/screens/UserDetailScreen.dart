
import 'package:flutter/material.dart';
import 'package:stuck/University_Department_Data/Department_List.dart';
class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  List<String> Courses=[];
  List<String> Branchs=[];
  String? selectedDepartment;
  String? selectedCourse;
  String? selectedBranch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 50,),
          DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),),
              hint: Text("Select Department"),
              value: selectedDepartment,
              items: department.map((e){
                return DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged:(val){
                selectedCourse=null;
                selectedBranch=null;
                Branchs=[];
                setState(() {
                  selectedDepartment=val;
                  Courses=departmentToCourse[selectedDepartment]!;

                });
              },
            isExpanded: true,
          ),

          SizedBox(height: 50,),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),),
            hint: Text("- Select Course -"),
            value: selectedCourse,
            items: Courses.map((e){
              return DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              );
            }).toList(),
            onChanged:(val){
              selectedBranch=null;
              setState(() {
                selectedCourse=val;
                Branchs=courseToBranch[selectedCourse]!;

              });
            },
            isExpanded: true,
          ),

          SizedBox(height: 50,),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(),),
            hint: Text("- Select Branch -"),
            value: selectedBranch,
            items: Branchs.map((e){
              return DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              );
            }).toList(),
            onChanged:(val){

              setState(() {
                selectedBranch=val;

              });
            },
            isExpanded: true,
          ),






        ],
      ),
    );
  }
}

