import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart'as umd;
import 'package:stuck/utils/chat_methods.dart';
class PersonalChatScreen extends StatefulWidget {
  umd.User user;
  umd.User currUser;
  PersonalChatScreen(this.user,this.currUser);

  @override
  State<PersonalChatScreen> createState() => _PersonalChatScreenState(this.user,this.currUser);
}

class _PersonalChatScreenState extends State<PersonalChatScreen> {
  var _messageController =TextEditingController();
  umd.User user;

  umd.User currUser;
  _PersonalChatScreenState(this.user,this.currUser);
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
    appBar: AppBar(
      elevation: 0.05,
      leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
        Navigator.pop(context);
      },),
      title: Text(user.name!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),centerTitle: true,backgroundColor: Colors.white,),
    bottomNavigationBar: Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.02),
      child: SizedBox(height: height*0.1,
      child: TextField(
        controller: _messageController,
        decoration: InputDecoration(suffixIcon: IconButton(icon:Icon(Icons.send),onPressed: ()async{
        
          if(_messageController.text==""){

          }
          else
          await ChatMethods().saveMessage(user,currUser,_messageController.text);
          _messageController.clear();
        },),border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.grey),borderRadius: BorderRadius.circular(height*0.05)),
        
        ),
      ),
      ),
    ),
    body: SafeArea(child: Column(children: [
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chats").doc(ChatMethods().getDoc(user, currUser)).collection("messages").snapshots(),
        builder: (context,snapshot){
        if(snapshot.hasError) return Center(child: Text("Internal Error"),);
        if(snapshot.hasData)
        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context,index){
              var temp=snapshot.data?.docs[index];
         if(temp!.get("sender")==currUser.email){
           return Padding(padding: EdgeInsets.only(right: width*0.03,left:width*0.3,top: height*0.005),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Container(
                 decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(height*0.02)),
                 
                 child: Padding(
                   padding: EdgeInsets.all(height*0.01),
                   child: RichText(text: TextSpan(text: temp.get("message"),style: TextStyle(fontWeight: FontWeight.w700,fontSize: height*0.02))),
                 ),
               ),
             ],
           ),
           );
         }
         else{
           return Padding(padding: EdgeInsets.only(right: width*0.3,left:width*0.03,top: height*0.005),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Container(
                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(height*0.02)),
                 child: Padding(
                   padding: EdgeInsets.all(height*0.01),
                   child: RichText(text: TextSpan(text: temp.get("message"),style: TextStyle(fontWeight: FontWeight.w700,fontSize: height*0.02))),
                 ),
               ),
             ],
           ),
           );;
         }
        }));
        return Center(child: Text("Start a Conversation"),);
      })
    ],)),
    );
  }
}