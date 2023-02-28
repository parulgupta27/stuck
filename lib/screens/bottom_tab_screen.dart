import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/models/user_model.dart' as umd;
import 'package:stuck/screens/HomeScreen.dart';
import 'package:stuck/screens/add_post_screen.dart';
import 'package:stuck/screens/search_screen.dart';
import 'package:stuck/screens/signed_user_profile.dart';
import 'package:stuck/widgets/post_grid_view.dart';
class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({super.key});

  @override
  State<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  umd.User user=umd.User();
  getUser()async{
  var ref=await FirebaseFirestore.instance.collection("students").doc(_auth.currentUser?.email).get();
  user.fromObj(ref);
setState(() {
  
});
}@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  final _auth=FirebaseAuth.instance;
  var _currentIndex=0;
  void changePage(int val) {
    controller.jumpToPage(val);
    _currentIndex = val;
    setState(() {});
  }

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
            child: PageView(
          physics: NeverScrollableScrollPhysics(),
          allowImplicitScrolling: false,
          controller: controller,
          children: [
            HomeScreen(),
            SearchScreen(),
            AddPostScreen(user),
            Scaffold(body: Center(child: Text("Notifictions")),),
            SignedUserProfile(user),
          ],
        )),
        bottomNavigationBar: Material(
          elevation: 3,
          child: Container(
            height: height * 0.08,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 242, 253),
                border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 249, 249, 249), width: 3))),
            child: TabBar(
                 
                indicator: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 4, color: Colors.blueGrey))),
               indicatorSize: TabBarIndicatorSize.label,
                onTap: changePage,
                tabs: [
                  Padding(
                    padding:EdgeInsets.only(top: height*0.003),
                    child: Icon(
                      Icons.home,
                      size: height * 0.03,
                      color: _currentIndex == 0 ? Colors.blueGrey : Colors.black,
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(top: height*0.003),
                    child: Icon(
                      Icons.search,
                      size: height * 0.03,
                      color: _currentIndex == 1 ? Colors.blueGrey : Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*0.003),
                    child: Icon(
                      Icons.add,
                      size: height * 0.03,
                      color: _currentIndex == 2 ? Colors.blueGrey : Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*0.003),
                    child: Icon(
                      Icons.notification_add,
                      size: height * 0.03,
                      color: _currentIndex == 3 ? Colors.blueGrey : Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*0.003),
                    child:
                    user.url=="url"?Icon(
                      Icons.person,
                      size: height * 0.03,
                      color: _currentIndex == 4 ? Colors.blueGrey : Colors.black,
                    ):
                    CircleAvatar(
                      radius: height*0.015,
                      backgroundColor:Colors.white,
                      backgroundImage: NetworkImage(user.url.toString()),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
