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

  String _value = "";
  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  void _setName(String value) => setState((){_value = value;});

  void _openSnack(){
    _scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text(_value),));

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(onChanged: _setName),
              new RaisedButton(child: new Text("Send to SnackBar"), onPressed: _openSnack,),
            ],
          ),
        ),
      ),
    );
  }
}
