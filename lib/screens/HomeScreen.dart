import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        body: SafeArea(
            child: Padding(
              child: Column(children: [
                SizedBox(height: 10,),
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("posts").snapshots(),
                  builder: (context,snapshot){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                    return Container(
                      height: 350,
                      width: double.infinity,
                      child: Image.network(snapshot.data!.docs[index].get("post_url"),fit: BoxFit.cover,));
                    }),
                  );
                })
              ]),
          padding: EdgeInsets.symmetric(horizontal: 10),
        )),
      
    );
  }
}
