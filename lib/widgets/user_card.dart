import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
class UserCard extends StatelessWidget {
  String url;
  String name;
  String department;
  UserCard(this.url,this.name,this.department);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Padding(padding: EdgeInsets.symmetric(horizontal: width*0.015),
      child: ListTile(
        leading: CircleAvatar(radius: height*0.025,backgroundImage:NetworkImage(url),),
        title: Text(name),
        subtitle: Text(department,style: TextStyle(fontSize: height*0.014),),
      ),
      ),
    );
  }
}