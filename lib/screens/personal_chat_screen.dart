import 'package:flutter/material.dart';
import 'package:stuck/models/user_model.dart';
class PersonalChatScreen extends StatefulWidget {
  User user;
  PersonalChatScreen(this.user);

  @override
  State<PersonalChatScreen> createState() => _PersonalChatScreenState(this.user);
}

class _PersonalChatScreenState extends State<PersonalChatScreen> {
  User user;
  _PersonalChatScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
    appBar: AppBar(
      elevation: 0.05,
      title: Text(user.name!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),centerTitle: true,backgroundColor: Colors.white,),
    );
  }
}