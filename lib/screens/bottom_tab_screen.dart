import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/screens/HomeScreen.dart';
import 'package:stuck/screens/search_screen.dart';

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({super.key});

  @override
  State<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  int _currentIndex = 0;
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
      length: 4,
      child: Scaffold(
        body: SafeArea(
            child: PageView(
          physics: NeverScrollableScrollPhysics(),
          allowImplicitScrolling: false,
          controller: controller,
          children: [
            HomeScreen(),
            SearchScreen(),
            Scaffold(
              body: Text("Hii"),
            ),
            Scaffold(
              body: Text("Sushu"),
            ),
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
                      Icons.notification_add,
                      size: height * 0.03,
                      color: _currentIndex == 2 ? Colors.blueGrey : Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*0.003),
                    child: Icon(
                      Icons.person,
                      size: height * 0.03,
                      color: _currentIndex == 3 ? Colors.blueGrey : Colors.black,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
