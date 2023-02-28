import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/utils/Utils.dart';

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
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            context: context, builder:(context) {
                            return Container(
                              height:screensize.height*0.5 ,
                              color: Colors.white,
                            );
                          },);
        
                        },icon: Icon(Icons.more_vert),),
        
                      ),
                      height: 50,
        
                    ),
                    SizedBox(height: 15,),
                    Container(height: 0.5,color: Colors.black,),
        
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(snapshot.data!.docs[index].get("post_url"),fit: BoxFit.cover,)),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline_sharp)),
                        IconButton(onPressed: (){}, icon:Icon(Icons.messenger_outline)),
                        IconButton(onPressed: (){}, icon:Icon(Icons.screen_share_outlined)),
                      ],
                    ),
                    Row(
                    children: [
                      SizedBox(width: 10,),
                      Text(snapshot.data!.docs[index].get('name'),style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 8,),
                      Text(snapshot.data!.docs[index].get('caption'),),
                      SizedBox(width: 10,),
                    ],
                  ),
                  Positioned(
                  left: 2,
                    child: RichText(
                      textDirection:TextDirection.ltr,
                      text: TextSpan(
                      text: " ${snapshot.data!.docs[index].get('name').toString()} ",
                      style: TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: snapshot.data!.docs[index].get('caption'),
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),),
                  ),    
                    SizedBox(height: 10,),
                    Container(height: 0.5,color: Colors.grey,),
                  ],
                );
                }),
              );
            })
          ]),
        ),
      
    );
  }
}
