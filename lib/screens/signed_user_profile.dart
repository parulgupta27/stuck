import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart';
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
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;

    return Scaffold(
    body:  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.00),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: height*0.015,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
              Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back))
            ],),
          SizedBox(
            height: height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.03),
            child: Row(
              children: [
                Container(
                  height: height * 0.09,
                  child: CircleAvatar(
                      radius: height * 0.045,
                      backgroundImage: NetworkImage(user.url!)),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                Container(
                  height: height * 0.09,
                  width: width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.name!,
                        style: TextStyle(
                            fontSize: height * 0.022,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.003,
                      ),
                      Text(
                        user.department!,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: height * 0.014,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.012,
          ),
          (user.bio!="")?
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Container(
              child: Text(
               user.bio!,
                style: TextStyle(
                    fontSize: height * 0.015, fontWeight: FontWeight.w500),
              ),
            ),
          ):SizedBox(height: 0,),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02),
            child: Row(
              children: [
                Container(
                  height: height * 0.12,
                  width: width * 0.46,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 215, 215, 215),
                    borderRadius: BorderRadius.circular(height * 0.01),
                    
                  ),
                  child: Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("100K",style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.w700),),
                    Text("Connections",style: TextStyle(fontSize: height*0.016,fontWeight: FontWeight.w500),),
                  ],)),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                Container(
                  height: height * 0.12,
                  width: width * 0.46,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 215, 215, 215),
                    borderRadius: BorderRadius.circular(height * 0.01),
                  ),
                   child: Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(posts.toString(),style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.w700),),
                    Text("Posts",style: TextStyle(fontSize: height*0.016,fontWeight: FontWeight.w500),),
                  ],)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: width*0.02),
          child: SizedBox(height: height*0.04,
          width: double.infinity,
          child: ElevatedButton(child: Text("Edit Profile"),onPressed: (){},),
          ),),
          SizedBox(height: height*0.03,),
          Divider(
           thickness: 3, 
           height: 2,
          ),
          SizedBox(height: height*0.005,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.005),
            child: Text("Posts",style: TextStyle(fontSize: height*0.025,fontWeight: FontWeight.w700),),
          )
        ,SizedBox(height: height*0.008,),
        PostGridView(user, size),
        ]),
      ),
    ),
    );
  }
}