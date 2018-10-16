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

class MyItem {
  bool isExpanded;
  String header;
  Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp> {
  List<MyItem> _items = new List<MyItem>();

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < 10; i++) {
      _items.add(new MyItem(
          false,
          'Item $i',
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Text('Item'),
          )));
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return new ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return new Container(
          padding: EdgeInsets.all(5.0),
          child: new Text('Header ${item.header}'),
        );
      },
      body: item.body,
      isExpanded: item.isExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new ListView(
          children: <Widget>[
            new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded){
                setState(() {
                   _items[index].isExpanded = !_items[index].isExpanded;               
                                });
                
              },
              children: _items.map(_createItem).toList(),
            ),
          ],
        )
      
      ),
    );
  }
}
