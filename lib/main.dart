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

enum Animals{Cat,Dog,Fish,Carrot}

class _State extends State<MyApp> {

  String _select = "Make a selection";
  Animals _selected = Animals.Cat;
  List<PopupMenuEntry<Animals>> _items = new List<PopupMenuEntry<Animals>>();

  @override
    void initState() {
      // TODO: implement initState
      for(Animals animal in Animals.values){
        _items.add(new PopupMenuItem(
          child: new Text(_getDisplay(animal)),
          value: animal,
        ));
      }
    }

  void _onSelected(Animals animal){
    setState(() {
          _selected = animal;
          _select = "You select ${_getDisplay(animal)}";
        });
  }

  String _getDisplay(Animals animal){
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);

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
          child: new Row(
            children: <Widget>[
              new Text(_select),
              new PopupMenuButton<Animals>(
                child: new Icon(Icons.explore),
                initialValue: Animals.Cat,
                onSelected: _onSelected,
                itemBuilder: (BuildContext context){
                  return _items;
                },

              )
            ],
          )
        ),
      ),
    );
  }
}
