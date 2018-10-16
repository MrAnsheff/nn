import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  State createState() => new _State();
}

class Choice{
  String title;
  IconData icon;

  Choice(this.title, this.icon);
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin{

  TabController _controller;
  List<Choice> _items =  <Choice>[
   Choice("CAR", Icons.directions_car),
   Choice("BICYCLE", Icons.directions_bike),
   Choice("BOAT", Icons.directions_boat),
   Choice("BUS", Icons.directions_bus),
   Choice("TRAIN", Icons.directions_railway),
   Choice("WALK", Icons.directions_walk),
  ];

  @override
    void initState() {
      // TODO: implement initState
      _controller = new TabController(length: _items.length, vsync: this);
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
        bottom: new PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: new Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: new Container(
              height: 48.0,
              alignment: Alignment.center,
              child: new TabPageSelector(controller: _controller,),
            ),
          ),
        ),
      ),
      body: new TabBarView(
        controller: _controller,
        children: _items.map((Choice item){
          return new Container(
            padding: EdgeInsets.all(25.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Text(item.title),
                  new Container(padding: EdgeInsets.only(top: 20.0)),
                  new Icon(item.icon, size: 120.0,),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
