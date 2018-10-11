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

  void _add() => setState((){_value = DateTime.now().toString();});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _add,
        backgroundColor: Colors.red,
        child: new Icon(Icons.add),
      ),
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
