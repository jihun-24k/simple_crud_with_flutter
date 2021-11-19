import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'page_route.dart';
import 'page_state.dart';

class MainPage extends StatefulWidget{
  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage>{

  void _onAdd() => Navigator.pushNamed(context, CREATE_PAGE);
  void _onEdit() => Navigator.pushNamed(context, DETAIL_PAGE);

  // 리스트와 추가버튼을 만든다.
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('리스트')),
      body: Consumer<SimpleState>
              (builder: (context, simpleState ,child) => ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: simpleState.cruds.length,
                itemBuilder: (BuildContext context, int idx){
                  return Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(simpleState.cruds[idx].title),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => {_onEdit()}),
                      ],
                    ),
                  );
                })),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => {_onAdd()},
      ),
    );
  }
}