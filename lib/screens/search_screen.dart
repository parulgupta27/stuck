import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart';
import 'package:stuck/providers/search_provider.dart';
import 'package:stuck/screens/signed_user_profile.dart';
import 'package:stuck/screens/user_profile.dart';
import 'package:stuck/utils/storage_method.dart';
import 'package:stuck/widgets/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stuck/widgets/user_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  User user;
  SearchScreen(this.user);

  @override
  State<SearchScreen> createState() => _SearchScreenState(this.user);
}

class _SearchScreenState extends State<SearchScreen> {
  User currUser;
  _SearchScreenState(this.currUser);
  @override
  var controller = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var _firestore = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    print("build");
    var provider = Provider.of<SearchProvider>(context);
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: height * 0.015,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SearchBar(controller, provider),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection("students")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(child: Consumer<SearchProvider>(
                    builder: (context, value, child) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                           
                            if (snapshot.data!.docs[index]
                                .get("name")
                                .toString()
                                .toLowerCase()
                                .contains(value.val.toString().toLowerCase())) {
                                
                                  User user=User();  
                                  user.fromObj(snapshot.data!.docs[index] as DocumentSnapshot<Map<String,dynamic>> );
                              return UserCard(user,(){
                                if(user.email!=currUser.email)
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile(user,currUser)));
                                else Navigator.push(context, MaterialPageRoute(builder: (context)=>SignedUserProfile(currUser)));
                                });
                            }
                            else{
                              return SizedBox(height: 0,);
                            }
                          });
                    },
                  ));
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.blueGrey),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
