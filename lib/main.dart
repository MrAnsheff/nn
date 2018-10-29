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
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Its an image'),
              new Container(
                padding: EdgeInsets.all(40.0),
                child: null,
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.blueAccent, width: 2.0),
                  gradient: RadialGradient(colors: <Color>[Colors.blueAccent, Colors.blueGrey])
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
