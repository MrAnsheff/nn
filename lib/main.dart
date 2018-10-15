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

  List<Widget> _list = new List<Widget>();
  int _counter = 0;

  @override
    void initState() {
      // TODO: implement initState
      for(var i = 0; i<5; i++){
        Widget child = _newItem(i);
        _list.add(child);
        _counter = i+1;
      }
    }

  void _onClick(){
    Widget child = _newItem(_counter);
    setState(() {
         _list.add(child); 
        });
    
  }

  Widget _newItem(int key){
    Key _key = new Key('Item $key');
    Widget _item = new Container(
      key: _key,
      child: new Chip(
        label: new Text('$key Name Here'),
        onDeleted: () =>_deleteItem(_key),
        deleteButtonTooltipMessage: "Delete",
        deleteIconColor: Colors.red,
        avatar: new CircleAvatar(backgroundColor: Colors.grey.shade800, child: new Text(key.toString()),),
      ),
    );
    _counter++;
    return _item;
  }

  void _deleteItem(Key key){
    for(var i =0; i<_list.length; i++){
      Widget _child = _list.elementAt(i);
      if(_child.key == key){
        setState(() {
                  _list.removeAt(i);
                });
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      floatingActionButton: new FloatingActionButton(child: Icon(Icons.plus_one,), onPressed: _onClick,),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: _list,
          ),
        ),
      ),
    );
  }
}
