import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_main.dart';
import 'page_create.dart';
import 'page_detail.dart';
import 'page_state.dart';

void main() => runApp(
    ChangeNotifierProvider(
      create: (context) => SimpleState(),
      child: StateList(),
    ));

const String ROOT_PAGE = '/';
const String CREATE_PAGE = '/create';
const String DETAIL_PAGE = '/detail';

class StateList extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '투두투두투두',
      debugShowCheckedModeBanner: false,
      initialRoute: ROOT_PAGE,
      routes: {
        ROOT_PAGE: (context) => MainPage(),
        CREATE_PAGE: (context) => CreatePage(),
        //DETAIL_PAGE: (context) => DetailPage(),
      },
    );
  }
}
