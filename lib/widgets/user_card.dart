import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart';
import 'package:stuck/screens/user_profile.dart';
class UserCard extends StatelessWidget {
 User user;
  UserCard(this.user,this.func);
 VoidCallback func;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  Padding(padding: EdgeInsets.symmetric(horizontal: width*0.015),
        child: ListTile(
          onTap: func,
          leading: CircleAvatar(radius: height*0.025,backgroundImage:NetworkImage(user.url!),),
          title: Text(user.name!),
          subtitle: Text(user.department!,style: TextStyle(fontSize: height*0.014),),
      ),
    );
  }
}