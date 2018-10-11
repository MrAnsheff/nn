import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => new _State();
}

class _State extends State<MyApp> {

  Future _showDialog(BuildContext context, String message) async{
    return showDialog(
      context: context,
      child: AlertDialog(
        title: new Text(message),
        actions: <Widget>[
          new FlatButton(onPressed: () => Navigator.pop(context), child: new Text('Ok!'),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('All Widgets Here'),
              new RaisedButton(onPressed: () => _showDialog(context, "Do you like Flutter?"), child: new Text("Show"))
            ],
          ),
        ),
      ),
    );
  }
}
