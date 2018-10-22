import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => new _SecondState();
}

class _SecondState extends State<Second> {
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
              new Text("It's second page"),
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/Third'),
                child: Text("Next"),
              ),
              RaisedButton(
                onPressed: () {
                  if(Navigator.of(context).canPop()){
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pushNamed('/Home');
                  }
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