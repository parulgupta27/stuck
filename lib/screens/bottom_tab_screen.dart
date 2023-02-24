import 'package:flutter/material.dart';
import 'package:stuck/main.dart';

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
            Scaffold(
              body: Text("Hello"),
            ),
            Scaffold(
              body: Text("Parul"),
            ),
            Scaffold(
              body: Text("Hii"),
            ),
            Scaffold(
              body: Text("Sushu"),
            ),
          ],
        )),
        bottomNavigationBar: Container(
          height: height * 0.07,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey.shade500, width: 3))),
          child: TabBar(
              indicator: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 3, color: Colors.blueGrey))),
              indicatorSize: TabBarIndicatorSize.label,
              onTap: changePage,
              tabs: [
                Icon(
                  Icons.home,
                  size: height * 0.03,
                  color: _currentIndex == 0 ? Colors.blueGrey : Colors.black,
                ),
                Icon(
                  Icons.search,
                  size: height * 0.03,
                  color: _currentIndex == 1 ? Colors.blueGrey : Colors.black,
                ),
                Icon(
                  Icons.notification_add,
                  size: height * 0.03,
                  color: _currentIndex == 2 ? Colors.blueGrey : Colors.black,
                ),
                Icon(
                  Icons.person,
                  size: height * 0.03,
                  color: _currentIndex == 3 ? Colors.blueGrey : Colors.black,
                ),
              ]),
        ),
      ),
    );
  }
}
