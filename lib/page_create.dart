import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_state.dart';

class CreatePage extends StatefulWidget{
  static const String routeName = '/create';

  @override
  State createState() => CreatePageState();
}

class CreatePageState extends State<CreatePage>{
  final TextEditingController _titleContoller =
      TextEditingController();
  final TextEditingController _nameContoller =
      TextEditingController();

  void _onCreate(Function onCreate){
    var todo = new CRUD(title: _titleContoller.text, name: _nameContoller.text);
    onCreate(todo);
    Navigator.pop(context);
  }

  void _onCancel() => Navigator.pop(context);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('글 생성')),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Consumer<SimpleState>(
        builder: (context, simpleState, child) => Column(
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
                  onPressed: () => _onCreate(simpleState.add),
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
      ),
    );
  }
}