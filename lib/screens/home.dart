import 'package:flutter/material.dart';
import 'second.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  
  TextEditingController name;


  @override
    void initState() {
      // TODO: implement initState
      name = new TextEditingController();

    }
  
  void onPressed(){

    Navigator.push(context, new MaterialPageRoute(
      builder: (BuildContext context) => new Second(name.text), 
      ));
  }

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
              new TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Enter your name!"),
              ),
              RaisedButton(
                onPressed: onPressed,
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
