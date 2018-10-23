import 'package:flutter/material.dart';
import '../code/GlobalState.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  
  TextEditingController name;
  GlobalState _store = GlobalState.instance;

  @override
    void initState() {
      // TODO: implement initState
      name = new TextEditingController();
      _store.set("name", "");
      name.text = _store.get("name");
    }
  
  void onPressed(){
    _store.set("name", name.text);
    Navigator.of(context).pushNamed('/Second');
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
