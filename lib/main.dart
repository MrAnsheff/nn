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
  double _x;
  double _y;
  double _z;

  @override
  void initState() {
    // TODO: implement initState
    _x = 0.0;
    _y = 0.0;
    _z = 0.0;
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
              new Row(
                children: <Widget>[
                  new Text('X:'),
                  new Slider(
                    value: _x,
                    onChanged: (double value) => setState(() {
                          _x = value;
                        }),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text('Y:'),
                  new Slider(
                    value: _y,
                    onChanged: (double value) => setState(() {
                          _y = value;
                        }),
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text('Z:'),
                  new Slider(
                    value: _z,
                    onChanged: (double value) => setState(() {
                          _z = value;
                        }),
                  )
                ],
              ),
              new Transform(
                transform: Matrix4.skewY(_y),
                child: new Transform(
                  transform: Matrix4.skewX(_x),
                  child: new Transform(
                    transform: Matrix4.rotationZ(_z),
                    child: new Padding(
                      padding: EdgeInsets.all(32.0),
                      child: new Text("Oh NO!"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
