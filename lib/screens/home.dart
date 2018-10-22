import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home page'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("It's home page"),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/Second'),
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}