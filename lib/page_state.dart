import 'package:flutter/material.dart';

class SimpleState extends ChangeNotifier{
  late String _title;
  late String _name;

  void setPost(String title, String name){
    _title = title;
    _name = name;
  }

  String get title => _title;
  String get name => _name;
}