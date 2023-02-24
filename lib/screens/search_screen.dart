import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/providers/search_provider.dart';
import 'package:stuck/utils/storage_method.dart';
import 'package:stuck/widgets/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stuck/widgets/user_card.dart';
import 'package:provider/provider.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  var controller=TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  var _firestore=FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    var provider=Provider.of<SearchProvider>(context);
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return SafeArea(
      child: Scaffold(
        
        body: Column(children: [
        SizedBox(height: height*0.006,),
        Padding(
          padding:EdgeInsets.symmetric(horizontal: width*0.05),
          child: SearchBar(
          controller),
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
     return 
            Expanded(child: ListView.builder(
       itemCount: snapshot.data!.docs.length,
       itemBuilder: (context,index){
    
     return 
     (snapshot.data!.docs[index].get("name")).toString().contains(controller.text)? UserCard(snapshot.data!.docs[index].get("url"),snapshot.data!.docs[index].get("name"), snapshot.data!.docs[index].get("department")):SizedBox(height: 0,);
     }),);
     }
     else{
     return Center(child: CircularProgressIndicator(color: Colors.blueGrey),);
     }
   },),
       
        ],),
      ),
    );
  }
}