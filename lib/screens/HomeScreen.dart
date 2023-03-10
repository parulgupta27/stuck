import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/post_model.dart';
import 'package:stuck/models/user_model.dart';
import 'package:stuck/screens/chat_screen.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/widgets/PostWidget.dart';

class HomeScreen extends StatefulWidget {
  User user;
  HomeScreen(this.user);

  @override
  State<HomeScreen> createState() => _HomeScreenState(this.user);
}

class _HomeScreenState extends State<HomeScreen> {
  User user;
  _HomeScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return 
       Scaffold(
         appBar: AppBar
        (backgroundColor: Colors.white,
        elevation: 0.2,
          title:Text("Stuck!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
          centerTitle: false,
          titleSpacing: 0,
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>ChatScreen(user)));
            }, icon: Icon(Icons.message_outlined,color: Colors.black,)),
          ]),
        body: SafeArea(
          child: Column(children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("posts").snapshots(),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return Center(child:Text("Some Error Occured"));
                }
              if(snapshot.hasData){
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    
                    var data=snapshot.data!.docs[index];
                    PostModel post=PostModel();
                    post.fromObj(data as DocumentSnapshot<Map<String,dynamic>>);
                return PostWidget(post,user);
              }));
              }
              return Center(child: CircularProgressIndicator(),);
              }
                )
                ]
                
                )        
                
                ),
      
    );
  }
}
