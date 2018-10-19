import 'package:flutter/material.dart';
import 'name.dart';

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
  String _name;

  void name(String value){
    setState(() {
    _name = value;         
        });

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
              new Name(
                name: name,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Your name: $_name'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
