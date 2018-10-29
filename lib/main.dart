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
  int rotate;
  double _value;

  @override
    void initState() {
      // TODO: implement initState
      rotate = 0;
      _value = 0.0;
    }

  void _onChanged(double value){
    setState(() {
          _value = value;
          rotate = value.toInt();
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
              new Slider(onChanged: _onChanged, value: _value, min: 0.0, max: 4.0,),
              new RotatedBox(quarterTurns: rotate, child: new Text('Rotate text'),)
            ],
          ),
        ),
      ),
    );
  }
}
