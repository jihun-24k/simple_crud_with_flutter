import 'dart:collection';
import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';

class CRUD {
  int id;
  String title;
  String name;

  CRUD({required this.id, required this.title, required this.name});
}

class SimpleState extends ChangeNotifier{
  final List<CRUD> _cruds = [CRUD(id: 1, title: 'HelloWord', name: 'jihun')];

  UnmodifiableListView<CRUD> get cruds => UnmodifiableListView(_cruds);

  // 추가 상태
  void add(CRUD crud){
    if (cruds.last.id != null) {
      crud.id = cruds.last.id + 1;
    }else{
      crud.id = 1;
    }
    _cruds.add(crud);
    notifyListeners();
  }

  // 업데이트 상태
  void update(int id, String newTitle, String newName){
    var crud = _cruds.firstWhere((crud) => crud.id == id);
    crud.title = newTitle;
    crud.name = newName;
    notifyListeners();
  }

  // 아이디 읽어오
  CRUD read(int id){
    return _cruds.firstWhere((element) => element.id == id);
  }

  // 삭제
  void delete(int id){
    _cruds.removeWhere((element) => element.id == id);
    notifyListeners();
  }

}
