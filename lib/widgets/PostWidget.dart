import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/post_model.dart';
import 'package:stuck/models/user_model.dart'as umd;
import 'package:stuck/screens/signed_user_profile.dart';
import 'package:stuck/screens/user_profile.dart';
import 'package:stuck/utils/Utils.dart';
import 'package:stuck/utils/storage_method.dart';
class PostWidget extends StatefulWidget {
  PostModel post;
  PostWidget(this.post);

  @override
  State<PostWidget> createState() => _PostWidgetState(this.post);
}
navigateToUserProfile(String email,BuildContext context)async{
var _auth=FirebaseAuth.instance;
var ref=await FirebaseFirestore.instance.collection("students").doc(email).get();
umd.User user=umd.User();
user.fromObj(ref);
if(email==_auth.currentUser!.email){
Navigator.push(context, MaterialPageRoute(builder: (context)=>SignedUserProfile(user)));
}
else{
  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile(user)));
}
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
                        onTap: (){
                          navigateToUserProfile(post.email!, context);
                        },
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
                              child: Column(children: [
                                SizedBox(height: height*0.01,),
                                IconButton(onPressed: ()async{

                               var res=await Storage().deletePost(post);
                          print(post.id);
                          print(res);
                            Navigator.pop(context);
                            Utils().showSnackBar(context: context,content: res);
                          
                                }, icon: Icon(Icons.delete)),
                              ]),
                            );
                          },);
        
                        },icon: Icon(Icons.more_vert),),
        
                      ),
                      height: height*0.055,
        
                    ),
                    SizedBox(height: height*0.016,),
                    Container(height: 0.5,color: Colors.black,),
        
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
                    Row(
                    children: [
                      SizedBox(width: width*0.011,),
                      Text(post.name!,style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: width*0.009,),
                      Text(post.caption!,),
                      SizedBox(width:  width*0.011,),
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