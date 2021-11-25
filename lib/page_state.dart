import 'dart:core';

import 'package:flutter/material.dart';

class CRUD {
  String title;
  String name;

  CRUD({required this.title, required this.name});
}

class SimpleState extends ChangeNotifier{
  List<CRUD> _cruds = [];

  List<CRUD> get cruds => _cruds;

  // 추가 상태
  void add(CRUD crud){
    _cruds.add(crud);
    notifyListeners();
  }

  // 업데이트 상태
  void update(int id, String newTitle, String newName){
    _cruds[id].title = newTitle;
    _cruds[id].name = newName;
    notifyListeners();
  }
  
  // 삭제
  void delete(int id){
    _cruds.removeAt(id);
    notifyListeners();
  }
}
