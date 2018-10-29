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
  bool _visible;

  @override
    void initState() {
      // TODO: implement initState
      _visible = false;
    }

  void _toggleVisible(){
    setState(() {
          _visible = !_visible;
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
              new Opacity(opacity: _visible ? 1.0: 0.2,
              child: new Text('Now you see me?'),),
              new RaisedButton(onPressed: _toggleVisible, child: new Text('Toggle'),),
            ],
          ),
        ),
      ),
    );
  }
}
