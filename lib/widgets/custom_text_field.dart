import 'package:flutter/material.dart';
import 'package:stuck/main.dart';
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  IconData icon;
  String hint;
  bool obsecure;
CustomTextField(this.controller,this.hint,this.icon,this.obsecure);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return TextFormField(
      strutStyle: StrutStyle(),
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.blueGrey)),
      ),
    );
  }
}