import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
import 'package:stuck/providers/search_provider.dart';

class SearchBar extends StatefulWidget {
  TextEditingController controller;
  SearchProvider provider;
  SearchBar(this.controller,this.provider);

  @override
  State<SearchBar> createState() => _SearchBarState(this.controller,this.provider);
}

class _SearchBarState extends State<SearchBar> {
  var controller;
  SearchProvider provider;
  _SearchBarState(this.controller,this.provider);
  @override
  void pressed() {}
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return 
SizedBox(
  height: height*0.07,
  child:   TextField(
    controller: controller,
    onChanged: (value){
      provider.setVal(value);
    },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  fillColor: Colors.grey,
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(height * 0.01),
                    )),
            
            ),
);
  }
}
