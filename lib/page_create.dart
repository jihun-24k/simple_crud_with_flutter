import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'page_route.dart';
import 'page_state.dart';

class CreatePage extends StatefulWidget{
  @override
  State createState() => CreatePageState();
}

class CreatePageState extends State<CreatePage>{
  final TextEditingController _titleContoller =
      TextEditingController();
  final TextEditingController _nameContoller =
      TextEditingController();

  void _onCreate(BuildContext context){
    final String title = _titleContoller.text;
    final String name = _nameContoller.text;
    final SimpleState state = Provider.of<SimpleState>(context, listen: false);
    state.setPost(title, name);

    Navigator.pop(context);
  }

  void _onCancel() => Navigator.pop(context);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('글 생성')),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              controller: _titleContoller,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              controller: _nameContoller,
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Create'),
                  onPressed: () => _onCreate(context),
                ),
                RaisedButton(
                  child: Text('Cancel'),
                  onPressed: _onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}