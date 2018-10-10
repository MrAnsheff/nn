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

  bool _value1 = false;
  bool _value2 = false;

  void _getChange1(bool value) => setState((){ _value1 = value; });
  void _getChange2(bool value) => setState((){ _value2 = value; });

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
              new Switch( value: _value1, onChanged: _getChange1, activeColor: Colors.red,),
              new SwitchListTile(value: _value2, onChanged: _getChange2, activeColor: Colors.green,
               title: new Text('Switched Text', style: TextStyle( fontWeight: FontWeight.bold, color: Colors.cyan,),),)
            ],
          ),
        ),
      ),
    );
  }
}
