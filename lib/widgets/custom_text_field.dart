import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  IconData icon;
  String hint;
CustomTextField(this.controller,this.hint,this.icon);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.blueGrey)),
      ),
    );
  }
}