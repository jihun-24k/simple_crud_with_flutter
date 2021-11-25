import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_state.dart';

class ScreenArguments {
  final int crudID;
  ScreenArguments(this.crudID);
}

class DetailPage extends StatefulWidget{
  static const String routeName = '/detail';

  DetailPage(this._index);
  final int _index;

  @override
  State createState() => DetailPageState(_index);
}

class DetailPageState extends State<DetailPage>{
  late TextEditingController _titleContoller;
  late TextEditingController _nameContoller;

  DetailPageState(this._index);
  final int _index;
  
  void _onEdit (Function onEdit){
    onEdit(_index, _titleContoller.text, _nameContoller.text);
    Navigator.pop(context);
  }

  void _onDelete (Function onDelete){
    onDelete(_index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('글 수정 및 삭제'),),
      body: Consumer<SimpleState>(
        builder: (context, simpleState, child) => Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              controller: _titleContoller = TextEditingController(text: simpleState.cruds[_index].title),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              controller: _nameContoller = TextEditingController(text: simpleState.cruds[_index].name),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Edit'),
                  onPressed: () => _onEdit(simpleState.update),
                ),
                RaisedButton(
                  child: Text('Delete'),
                  onPressed: () => _onDelete(simpleState.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}