import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => new _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Third page'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("It's third page"),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/Second'),
                child: Text("Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}