import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

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
