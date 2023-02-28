import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/post_model.dart';

class PostWidget extends StatefulWidget {
  PostModel post;
  PostWidget(this.post);

  @override
  State<PostWidget> createState() => _PostWidgetState(this.post);
}

class _PostWidgetState extends State<PostWidget> {
   PostModel post;
   _PostWidgetState(this.post);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return Column(
                  children: [
                    SizedBox(
                      child: ListTile(
                       leading:CircleAvatar(
                         child: CircleAvatar(
                           backgroundImage: NetworkImage(post.profile_url!,),
                           radius: height*0.019,
                         ),
                         backgroundColor: Colors.grey,
                         radius: height*0.022,
                       ),
                        title: Text(post.name!),
                        subtitle: Text(post.department!),
                        trailing: IconButton(onPressed: (){
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height*0.020)),
                            context: context, builder:(context) {
                            return Container(
                              height:height*0.5,
                              color: Colors.white,
                            );
                          },);
        
                        },icon: Icon(Icons.more_vert),),
        
                      ),
                      height: height*0.065,
        
                    ),
                    SizedBox(height: height*0.016,),
                    
        
                    Container(
                      height: height*0.42,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(post.post_url!,fit: BoxFit.cover,)),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon:Icon(Icons.favorite_outline_sharp)),
                        IconButton(onPressed: (){}, icon:Icon(Icons.messenger_outline)),
                        IconButton(onPressed: (){}, icon:Icon(Icons.screen_share_outlined)),
                      ],
                    ),
                    
                  Positioned(
                  left: 2,
                    child: RichText(
                      textDirection:TextDirection.ltr,
                      text: TextSpan(
                      text: " ${post.name} ",
                      style: TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text:post.caption,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),),
                  ),    
                    SizedBox(height: height*0.011,),
                    Container(height: 0.5,color: Colors.grey,),
                  ],
                );;
  }
}