import 'package:flutter/material.dart';

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

  String _value = '';

  void _onClick(String value) => setState((){_value = value;});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(icon: new Icon(Icons.add), onPressed: () => _onClick('value1'),),
        new IconButton(icon: new Icon(Icons.laptop), onPressed: () => _onClick('value2'),),
        new IconButton(icon: new Icon(Icons.kitchen), onPressed: () => _onClick('value3'),),
      ],
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
            ],
          ),
        ),
      ),
    );
  }
}
