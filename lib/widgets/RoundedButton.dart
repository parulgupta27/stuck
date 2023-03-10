import 'package:flutter/material.dart';
import 'package:stuck/main.dart';

class RoundedButton extends StatelessWidget {
    Widget label;
    Color color;
    VoidCallback callback;
   RoundedButton(this.label,this.callback,this.color);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    height=size.height;
    width=size.width;
    return SizedBox(
      height: height*0.04,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed:callback,
          child:label,
    
      ),
    );
  }
}
