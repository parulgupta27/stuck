import 'package:flutter/material.dart';
class SearchProvider with ChangeNotifier{
String _val="";
get val=>_val;
setVal(String value){
  _val=value;
  notifyListeners();
}
}