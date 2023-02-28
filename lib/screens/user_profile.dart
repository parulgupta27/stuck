import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import '../models/user_model.dart';

class UserProfile extends StatefulWidget {
  User user;
  UserProfile(this.user);

  @override
  State<UserProfile> createState() => _UserProfileState(this.user);
}

class _UserProfileState extends State<UserProfile> {
  User user;
  _UserProfileState(this.user);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        
        backgroundColor: Colors.white,
        ),
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: height * 0.01,
          ),
          Row(
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
          SizedBox(
            height: height * 0.012,
          ),
          (user.bio!="")?
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
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
          Row(
            children: [
              Container(
                height: height * 0.12,
                width: width * 0.43,
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
                width: width * 0.43,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 215, 215, 215),
                  borderRadius: BorderRadius.circular(height * 0.01),
                ),
                 child: Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("100",style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.w700),),
                  Text("Posts",style: TextStyle(fontSize: height*0.016,fontWeight: FontWeight.w500),),
                ],)),
              ),
            ],
          ),
          SizedBox(
            height: height * .02,
          ),
          Row(
            children: [
              SizedBox(
                height: height*0.04,
                width: width*0.43,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                    onPressed: () {},
                    child: Center(
                      child: Text("Connect",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    )),
              ),
              SizedBox(width: width*0.04,),
              SizedBox(
                height: height*0.04,
                width: width*0.43,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                    onPressed: () {},
                    child: Center(
                      child: Text("Share",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                    )),
              ),
            ],
          ),
          SizedBox(height: height*0.03,),
          Divider(
           thickness: 3, 
           height: 2,
          ),
          SizedBox(height: height*0.005,),
          Text("Posts",style: TextStyle(fontSize: height*0.02,fontWeight: FontWeight.w600),)
        ]),
      ),
    ));
  }
}
