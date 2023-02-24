import 'package:flutter/material.dart';
import 'package:stuck/main.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  void pressed() {}
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return 
TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                fillColor: Colors.grey,
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(height * 0.01),
                  )),
          
          );
  }
}
