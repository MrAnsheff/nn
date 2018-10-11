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

  void _showBottom(){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          padding: EdgeInsets.all(32.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('This is Bottom', style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
              new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Click me'),),
            ],
          ),
        );
      },
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
              new RaisedButton(onPressed: _showBottom, child: new Text('Show Bottom!')),
            ],
          ),
        ),
      ),
    );
  }
}
