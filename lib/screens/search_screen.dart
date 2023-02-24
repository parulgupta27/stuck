import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/utils/storage_method.dart';
import 'package:stuck/widgets/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  var _firestore=FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return SafeArea(
      child: Scaffold(
        
        body: Column(children: [
        SizedBox(height: height*0.006,),
        Padding(
          padding:EdgeInsets.symmetric(horizontal: width*0.05),
          child: SearchBar(),
        ),
        SizedBox(height: height*0.02,),
       StreamBuilder<QuerySnapshot>(
     stream: _firestore
            .collection("Kurukshetra University")
            .doc("UIET")
            .collection("BTech")
            .doc("CSE")
            .collection("2024").snapshots(),
     builder: (context, snapshot) {
     if(snapshot.hasData){
     return Expanded(child: ListView.builder(
       itemCount: snapshot.data!.docs.length,
       itemBuilder: (context,index){
     return ListTile(
       title: Text(snapshot.data!.docs[index].get("name")),
     );
     }),);
     }
     else{
     return Center(child: CircularProgressIndicator(color: Colors.blueGrey),);
     }
   },)
        ],),
      ),
    );
  }
}