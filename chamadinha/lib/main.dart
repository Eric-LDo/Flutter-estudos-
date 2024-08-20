// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar() ,
      body: Text('Hello, world!', selectionColor: Colors.white70,)
      )
    );
  }
}
