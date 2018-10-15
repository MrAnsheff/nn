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
  String _value = "No Data";

  void _onChange(){
    setState(() {
          _value = new DateTime.now().toString();
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
              new Text(_value),
              new IconButton(icon: new Icon(Icons.time_to_leave,),
              onPressed: _onChange,
              tooltip: "Click Me!",)
            ],
          ),
        ),
      ),
    );
  }
}
