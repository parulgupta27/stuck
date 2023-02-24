/*import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  List<dynamic> department=[];
  List <dynamic> courseWithParent=[];
  List <dynamic> course=[];
  List <dynamic> branchWithParent=[];
  List <dynamic> branch=[];

  String? dept_Id;
  String? courseId;
  String? branchId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    department.add({"Did":1,"Dept":"UIET"});
    department.add({"Did":2,"Dept":"Law"});
    department.add({"Did":3,"Dept":"Commerce"});

    this.courseWithParent=[
      {"Cid":1,"Course":"Btech","ParentId":1},
      {"Cid":2,"Course":"Mtech","ParentId":1},

      {"Cid":1,"Course":"Bachelor In Law","ParentId":2},
      {"Cid":2,"Course":"Master In Law","ParentId":2},
      {"Cid":3,"Course":"Ph.D ","ParentId":2},

      {"Cid":1,"Course":"M. phil","ParentId":3},
      {"Cid":2,"Course":"Master In Commerce","ParentId":3}
    ];

    this.branchWithParent=
    [
      //this is for btech
      {"Bid":1,"Branch":"CSE","CourseId":1},
      {"Bid":2,"Branch":"ECE","CourseId":1},
      {"Bid":3,"Branch":"ME","CourseId":1},
      {"Bid":4,"Branch":"BT","CourseId":1},

      //this is for mtech
      {"Bid":1,"Branch":"CSE","CourseId":2},
      {"Bid":2,"Branch":"ECE","CourseId":2},
      {"Bid":3,"Branch":"MVLSI","CourseId":2},
      {"Bid":4,"Branch":"BT","CourseId":2},

    ];


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100,),
            FormHelper.dropDownWidgetWithLabel(
                context,
                "Department :",
                "-- Select Department --",
                this.dept_Id,
                this.department,
                (onChangeVal){
                  this.dept_Id=onChangeVal;
                  print("Selected Department :${onChangeVal}");

                  this.course=this.courseWithParent.where((stateItem)=>stateItem['ParentId'].toString()==onChangeVal.toString(),
                  ).toList();
                  this.courseId=null;
                  setState(() {

                  });

                },
                (onValidateVal){
                  if(onValidateVal==null){
                    return "Please Select Country ";
                  }


                },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
                optionValue: "Did",
              optionLabel: "Dept",

            ),

            FormHelper.dropDownWidgetWithLabel(
                context,
                "Courses :",
                "-- Select Course --",
                this.courseId,
                this.course,
                (onChangeVal){
                 this.courseId=onChangeVal;
                 print("Selected Course :$onChangeVal");

                 this.branch=this.branchWithParent.where((stateItem)=>stateItem['CourseId'].toString()==onChangeVal.toString(),
                 ).toList();
                 this.branchId=null;
                 setState(() {

                 });

                },
                (onValidateVal){
                  return null;
                },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "Cid",
              optionLabel: "Course",
            ),
            FormHelper.dropDownWidgetWithLabel(
                context,
                "Branch :",
                "- Select Branch -",
                this.branchId,
                this.branch,
                (onChangeVal){
                  this.branchId=onChangeVal;
                },
                (onValidateVal){
                  return null;
                },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "Bid",
              optionLabel: "Branch",
                ),
          ],
        ),
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  final List<String> department=["UIET","LAW Department","Commerce Department"];

  final List<String> uietcourse=["BTECH","MTECH"];
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




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100,),

            Container(
              height: 60,
              width: 300,
              color: Colors.indigo.shade50,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),),
                hint: Text("Select Department"),
                value: selected_dept,
                  items: department.map((e){
                    return DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged:(val){

                  selected_course=null;
                  selected_branch=null;
                  branch=[""];


                    if(val=='UIET')
                    {
                      course=uietcourse;
                    }
                    else if(val=='LAW Department')
                    {
                      course=lawcourse;
                    }
                    else
                    {
                      course=commercecourse;
                    }

                  setState(() {
                    selected_dept=val;
                    print(val);
                    print(course);
                  });
              }
              ),
            ),

            SizedBox(height: 30,),
            //course

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
                hint: Text("Select Course"),
                value: selected_course,
                items: course.map((e){
                  return DropdownMenuItem<String>(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged:(val){
                selected_branch=null;


                if(val=="BTECH") {
                    branch=btecbranch;
                  }
                else if(val=="MTECH") {
                  branch=mtecbranch;
                  }
                else if(val=="Bachelor In Law")
                  {
                    branch=blawcourse;
                  }
                else if(val=="Master In Law"){
                  branch=mlawcourse;
                }
                else if(val=="Ph.D") {
                  branch=phdlawcourse;
                  }
                else if(val=="M.Phil") {
                  branch=mphilcommercecourse;
                  }
                else if(val=="Master In Commerce")
                  {
                    branch=mastercommercecourse;
                  }


                  setState(() {
                    selected_course=val;
                  });
                }
            ),

            SizedBox(height: 30,),
            //Branch
            DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: Text("Select Branch"),
                value: selected_branch,
                items: branch.map((e){
                  return DropdownMenuItem<String>(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged:(val){

                  setState(() {
                    selected_branch=val;
                  });
                }
            ),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );

  }
}


