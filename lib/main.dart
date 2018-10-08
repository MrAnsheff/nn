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

  String _value = "";

  void _onChanged(String value){
    setState(() {
          _value = "Changed: $value";
        });
  }

    void _onSubmitted(String value){
    setState(() {
          _value = "Submit: $value";
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
              new TextField(
                decoration: InputDecoration(
                  hintText: 'hint',
                  labelText: 'label',
                  icon: new Icon(Icons.people),
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.number,
                onChanged: _onChanged,
                onSubmitted: _onSubmitted,
              )
            ],
          ),
        ),
      ),
    );
  }
}
