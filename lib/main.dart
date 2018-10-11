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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('This is the Drawer'),
              new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Close Drawer'),),
            ],
          ),
        ),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('All Widgets Here'),
            ],
          ),
        ),
      ),
    );
  }
}
