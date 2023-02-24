
import 'package:flutter/material.dart';
import 'package:stuck/University_Department_Data/Department_List.dart';
class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {

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
                
                setState(() {
                  selectedDepartment=val;
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
            items: departmentToCourse[selectedDepartment]?.map((e){
              return DropdownMenuItem<String>(
                child: Text(e),
                value: e,
              );
            }).toList(),
            onChanged:(val){
              selectedBranch=null;
              setState(() {
                selectedCourse=val;
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
            items: courseToBranch[selectedCourse]?.map((e){
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

