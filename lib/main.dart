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
  
  static Duration duration = new Duration(milliseconds: 100);
  Timer timer;
  double _value = 0.0;
  bool isit = false;

  @override
    void initState() {
      // TODO: implement initState
      timer = new Timer.periodic(duration, _timeout);
    }

  void _timeout(Timer timer){
    if(!isit) return;
    setState(() {
          _value = _value + 0.01;
          if(_value == 1.0) isit = false;
        });
  }

  void _onPressed(){
    setState(() {
          isit = true;
          _value = 0.0;
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
              new LinearProgressIndicator(
                value: _value,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
              ),
              new RaisedButton(
                onPressed: _onPressed,
                child: new Text("Start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
