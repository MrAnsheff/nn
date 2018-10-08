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

  int _value = 0;

  void _add(){
    setState(() {
          _value++;
        });
  }

    void _remove(){
    setState(() {
          _value--;
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
              new Text('Value = $_value'),
              new IconButton(
                icon: new Icon(Icons.add), onPressed: _add,
              ),
                            new IconButton(
                icon: new Icon(Icons.remove), onPressed: _remove,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
