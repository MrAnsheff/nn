import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/second.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),

      },
      home: new Home(),
    );
  }
}