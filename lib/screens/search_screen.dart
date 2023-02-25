import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart';
import 'package:stuck/providers/search_provider.dart';
import 'package:stuck/screens/user_profile.dart';
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
              height: height * 0.006,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: SearchBar(controller, provider),
            ),
            SizedBox(
              height: height * 0.02,
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
                                
                                  User user=User(url: snapshot.data!.docs[index].get("url"), name:snapshot.data!.docs[index].get("name"), email: snapshot.data!.docs[index].get("email"), roll_no: snapshot.data!.docs[index].get("roll_no"), department: snapshot.data!.docs[index].get("department"), branch:snapshot.data!.docs[index].get("branch"), course: snapshot.data!.docs[index].get("course"), gender: snapshot.data!.docs[index].get("gender"), phoneNo: snapshot.data!.docs[index].get("phoneNo"), year:snapshot.data!.docs[index].get("year"),bio: snapshot.data!.docs[index].get("bio").toString());  
                              return UserCard(user);
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
