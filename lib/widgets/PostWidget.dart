import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stuck/models/post_model.dart';

class PostWidget extends StatelessWidget {
  PostModel
  post;
  PostWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 50,),

            Material(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:AssetImage('assets/Images/boy1.png') ,
                  radius: 40,
                ),
                title: Text("Lalit Kumar"),
                subtitle: Text("University Institute of Engineering & Technology"),
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(child: Text("Delete Post")),
                      PopupMenuItem(child: Text("Update Post")),

                    ];
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
