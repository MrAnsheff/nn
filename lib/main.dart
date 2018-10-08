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

  int tex = 1000;

  void _onPressed(){
    setState(() {

          tex++;

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
              new Text('$tex'),
              new RaisedButton(
                onPressed: _onPressed,
                child: Text('Press me!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
