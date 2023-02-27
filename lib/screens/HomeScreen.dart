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
        body: Column(children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("posts").snapshots(),
            builder: (context,snapshot){
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
              return Column(
                children: [
                  SizedBox(
                    child: ListTile(
                     leading:CircleAvatar(
                       child: CircleAvatar(
                         backgroundImage: NetworkImage(snapshot.data!.docs[index].get('profile_url',),),
                         radius: 18,
                       ),
                       backgroundColor: Colors.grey,
                       radius: 21,
                     ),
                      title: Text(snapshot.data!.docs[index].get('name')),
                      subtitle: Text(snapshot.data!.docs[index]['department']),
                      trailing: IconButton(onPressed: (){

                      },icon: Icon(Icons.more_vert),),

                    ),
                    height: 50,

                  ),
                  SizedBox(height: 10,),

                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(snapshot.data!.docs[index].get("post_url"),fit: BoxFit.cover,)),
                ],
              );
              }),
            );
          })
        ]),
      
    );
  }
}
