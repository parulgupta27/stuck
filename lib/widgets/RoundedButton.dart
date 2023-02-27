import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
    Widget label;
    VoidCallback callback;
   RoundedButton({Key? key,required this.label,required this.callback,required }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:callback,
        child:label,

    );
  }
}
