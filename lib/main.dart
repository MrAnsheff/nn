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

  String _value = '';
  List<BottomNavigationBarItem> _items;
  int _index = 0;

  @override
    void initState() {
      // TODO: implement initState
      _items = new List();
      _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.kitchen), title: new Text("Kitchen")));
      _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.keyboard), title: new Text("Keyboard")));
      _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.input), title: new Text("Input")));

    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _items,
        currentIndex: _index,
        onTap: (int item) => setState((){
          _index = item;
          _value = "Current vaule is $_index";
        }),
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
