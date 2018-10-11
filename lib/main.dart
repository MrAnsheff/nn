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
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  void _onPressed(){
    _scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text("It's Snack Bar!"),));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('All Widgets Here'),
              new RaisedButton(onPressed: _onPressed, child: new Text('Open Snack Bar')),
            ],
          ),
        ),
      ),
    );
  }
}
