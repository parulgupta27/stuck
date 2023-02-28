import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/post_model.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/widgets/PostWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screensize=Utils().getScreenSize();
    return 
       Scaffold(
        body: SafeArea(
          child: Column(children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("posts").snapshots(),
              builder: (context,snapshot){
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    
                    var data=snapshot.data!.docs[index];
                    PostModel post=PostModel();
                    post.fromObj(data as DocumentSnapshot<Map<String,dynamic>>);
                return PostWidget(post);
              }));
              }
                )
                ]
                
                )        
                
                ),
      
    );
  }
}
