import 'package:flutter/material.dart';
import '../code/GlobalState.dart';

class Second extends StatefulWidget {
  Second(this.name);
  String name;
  @override
  _SecondState createState() => new _SecondState(name);
}

class _SecondState extends State<Second> {
  GlobalState _store = GlobalState.instance;
  _SecondState(this.name);
  String name;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second page'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Your name is $name"),
              RaisedButton(
                onPressed: () {
                    Navigator.of(context).pop();
                },
                child: Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}