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

  int _value1 = 0;
  int _value2 = 0;

  void _setValue1(int value) => setState(()=> _value1 = value);
  void _setValue2(int value) => setState(()=> _value2 = value);

  Widget radioWidget(){
    List<Widget> _list = new List();
    for(int i = 0; i <3; i++){
      _list.add(new Radio( value: i, groupValue: _value1, onChanged: _setValue1,));
    }
    Column _column = new Column( children: _list,);

    return _column;
  }

   Widget radioWidgetList(){
    List<Widget> _list = new List();
    for(int i = 0; i <3; i++){
      _list.add(new RadioListTile( value: i, groupValue: _value2, onChanged: _setValue2, activeColor: Colors.lime[100], title: Text('$i'), subtitle: Text('Just Subtitle'), controlAffinity: ListTileControlAffinity.trailing,));
    }
    Column _column = new Column( children: _list,);

    return _column;
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
              radioWidget(),
              radioWidgetList(),
            ],
          ),
        ),
      ),
    );
  }
}
