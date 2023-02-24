import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/providers/search_provider.dart';

class SearchBar extends StatefulWidget {
  var controller;
  SearchBar(this.controller);

  @override
  State<SearchBar> createState() => _SearchBarState(this.controller);
}

class _SearchBarState extends State<SearchBar> {
  var controller;
  _SearchBarState(this.controller);
  @override
  void pressed() {}
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return 
TextField(
  controller: controller,
  onChanged: (val){
    SearchProvider().setVal(controller.text);
  },
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
