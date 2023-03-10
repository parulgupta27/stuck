import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart';
import 'package:stuck/screens/personal_chat_screen.dart';
import 'package:stuck/widgets/user_card.dart';
class ChatScreen extends StatefulWidget {

  User currUser=User();
  ChatScreen(this.currUser);

  @override
  State<ChatScreen> createState() => _ChatScreenState(this.currUser,);
}
class _ChatScreenState extends State<ChatScreen> {
  User currUser=User();
  _ChatScreenState(this.currUser);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Chats",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
        centerTitle: true,
        actions: [
        Padding(padding: EdgeInsets.only(right: width*0.02),
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: height*0.019,
          child: CircleAvatar(backgroundColor: Colors.white,
          radius: height*0.017,
          backgroundImage: NetworkImage(currUser.url!),
          ),
        ),
        ),
        ]),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.01),
          child: Column(children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection("students").doc(currUser.email).collection("chats").snapshots(),
              builder: (context,snapshot){
                if(snapshot.hasData)
              return Expanded(child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                var email=snapshot.data!.docs[index].get("email");
                return StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("students").doc(email).snapshots(),
                  builder: (context,snap){
                    if(snap.hasData){
                 User user=User();
                     var vari=snap.data;
                     user.fromObj(vari!);
                     return UserCard(user, () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalChatScreen(user,currUser)));
                     });}
                     return Center(child: CircularProgressIndicator());
                });
              })
              );
              if(snapshot.hasError)return Center(child: Text("Internal Error"),);
            return Center(child: CircularProgressIndicator(color: Colors.blueGrey),);
            })
          ]),
        ),
      ),
    );
  }
}