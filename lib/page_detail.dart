import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_state.dart';
import 'page_main.dart';

class ScreenArguments {
  final int id;
  ScreenArguments(this.id);
}

class DetailPage extends StatefulWidget{
  @override
  State createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage>{
  final _key = GlobalKey();
  final TextEditingController _titleContoller =
  TextEditingController();
  final TextEditingController _nameContoller =
  TextEditingController();

  var editList;
  late final SimpleState simpleState;

  void getId (BuildContext  context){
    final ScreenArguments args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    editList = new SimpleState().read(args.id);
    _titleContoller.text = editList.title;
    _nameContoller.text = editList.name;
  }
  
  void _onEdit (Function onEdit){
    onEdit(editList.id, editList.title, editList.name);
    Navigator.pop(context);
  }

  void _onDelete (Function onDelete){
    onDelete(editList.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    getId(context);
    return Scaffold(
      key: _key,
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
                labelText: 'Edit',
              ),
              controller: _titleContoller,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Delete',
              ),
              controller: _nameContoller,
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