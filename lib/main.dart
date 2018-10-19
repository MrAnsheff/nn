import 'package:flutter/material.dart';
import 'auth.dart';

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

  bool isAuth = false;

  void _onAuth(bool value){
    setState(() {
          isAuth = value;
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
              new Auth(
                isAuth: _onAuth,
              ),
              Text('Authorized: $isAuth'),
            ],
          ),
        ),
      ),
    );
  }
}
