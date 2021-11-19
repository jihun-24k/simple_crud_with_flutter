import 'dart:collection';

import 'package:flutter/material.dart';

class CRUD {
  late String title;
  late String name;

  CRUD({required this.title, required this.name});
}

class SimpleState extends ChangeNotifier{
  final List<CRUD> _cruds = [CRUD(title: 'Hello World', name: 'jihun')];

  UnmodifiableListView<CRUD> get cruds => UnmodifiableListView(_cruds);

  // 추가 상태
  void add(CRUD crud){
    _cruds.add(crud);
    notifyListeners();
  }


}
