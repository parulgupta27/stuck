import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  IconData icon;
  String hint;
  bool obsecure;
CustomTextField(this.controller,this.hint,this.icon,this.obsecure);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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