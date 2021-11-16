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

  // 리스트와 추가버튼을 만든다.
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('리스트')),
      body: Container(
        padding: EdgeInsets.fromLTRB(20,20,20,20),
        child: Column(
          children: <Widget>[
            // Coulmn 안에는 Expanded로 리스트를 추가
            Expanded(
                child: ListView(
                  children: [
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                    //ToDo 눌리면 Create부분으로..!
                    onPressed: () => {_onAdd()},
                    child: Icon(Icons.add),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}