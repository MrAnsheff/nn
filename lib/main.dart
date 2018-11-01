import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';


void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  Map<String, LatLng> coords;
  List<Marker> markers;
  MapController controller;

  @override
  void initState(){
    coords = new Map<String, LatLng>();
    controller = new MapController();
    coords.putIfAbsent("Krasnodar", ()=> new LatLng(45.07284, 38.97403));
    coords.putIfAbsent("Magnit", ()=> new LatLng(45.08284, 38.97403));
    coords.putIfAbsent("Castorama", ()=> new LatLng(45.05284, 38.97403));

    markers = new List<Marker>();

    for(var i = 0; i<coords.length; i++){
      markers.add(
        new Marker(
          height: 80.0,
          width: 80.0,
          point: coords.values.elementAt(i),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.blue),
        )
      );
    }

  } 

  void _showCoords(int index){
    controller.move(coords.values.elementAt(index), 16.0);
  }

  List<Widget> _buttons(){
    List<Widget> _list = new List<Widget>();

    for(var i =0; i<coords.length; i++){
      _list.add(new RaisedButton(onPressed: () => _showCoords(i), child: new Text(coords.keys.elementAt(i)),));
    }

    return _list;
  }


  @override
  Widget build(BuildContext context) {
   

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Карта Краснодара'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(2.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              Row(children: _buttons(),),
              new Flexible(
                  child: new FlutterMap(
                    mapController: controller,
                    options: new MapOptions(
                      center: new LatLng(45.07284, 38.97403),
                      zoom: 16.0
                    ),
                    layers: [
                      new TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a','b','c'],
                      ),
                      new MarkerLayerOptions(markers: markers),
                    ],
                  )
              )
            ],
          ),
        )
      ),
    );
  }
}