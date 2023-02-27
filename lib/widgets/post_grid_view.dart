import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import '../models/user_model.dart';
class PostsGridView extends StatefulWidget {
  User user;
  Size size;
  PostsGridView(this.user,this.size);

  @override
  State<PostsGridView> createState() => _PostsGridViewState(this.user,this.size);
}

class _PostsGridViewState extends State<PostsGridView> {
  Size size;
  List <Widget> pics=[];
  getPics()async{
    try{
    var ref=FirebaseFirestore.instance.collection("students").doc(user.email).collection("posts");
    StreamBuilder(
      stream: ref.snapshots(),
      builder: (context, snapshot) {
      return ListView.builder(
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context,index){
       pics.add(SingleChildScrollView(
         child: Container(
           height: size.width*0.27,
           width: size.width*0.27,
           child: Image.network(snapshot.data!.docs[index].get("url"),fit: BoxFit.cover,)),
       ));
      });
    },);
    print(pics);
    }
    on FirebaseException catch(e){
      print(e);
    }
    catch(e){
      print(e);
    }
  }
  User user;
  _PostsGridViewState(this.user,this.size);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPics();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.03),
      child: Expanded(child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: pics,
      )),
    );
  }
}