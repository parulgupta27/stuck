import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart';
import 'package:stuck/screens/bottom_tab_screen.dart';
import 'package:stuck/widgets/RoundedButton.dart';
import 'package:stuck/widgets/post_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SignedUserProfile extends StatefulWidget {
  User user;
  SignedUserProfile(this.user);
  @override
  State<SignedUserProfile> createState() => _SignedUserProfileState(this.user);
}
class _SignedUserProfileState extends State<SignedUserProfile> {
  User user;
  _SignedUserProfileState(this.user);
      int? posts;
    getPostCount()async{
      posts=await FirebaseFirestore.instance.collection("students").doc(user.email).collection("posts").snapshots().length;
    setState(() {
      
    });}
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostCount();

  }
  @override
   Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            user.name!,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: height * 0.008,
              ),
              Center(
                child: Column(children: [
                  Container(
                    height: height * 0.15,
                    width: height * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(height * 0.02),
                      child: Image.network(user.url!,fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  Text(
                    user.department!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: height * 0.018),
                  ),
                  SizedBox(
                    height: height * 0.008,
                  ),
                  user.bio!=""?
                  Container(
                    height: height * 0.05,
                    child: RichText(
                      text: TextSpan(
                        text: user.bio,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ):SizedBox(height: 0,),
                ]),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height*0.05,
                    child: Column(children: [
                      Text("Posts",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                      Text(""),
                    ]),
                  ),
                  SizedBox(width: width*0.1,),
                  Container(
                    height: height*0.05,
                    child: Column(children: [
                      Text("Connections",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                      Text(""),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: height*0.01,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.015),
                child: RoundedButton( Text("Edit Profile"), (){}, Colors.blue,),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Divider(
                thickness: 3,
                height: 2,
              ),
              SizedBox(
                height: height * 0.005,
              ),
              Text(
                "Posts",
                style: TextStyle(
                    fontSize: height * 0.02, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.008,
              ),
              PostGridView(user, size),
            ]),
          ),
        ));
  }
}