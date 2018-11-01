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
  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      new Marker(
        height: 80.0,
        width: 80.0,
        point: LatLng(45.07284, 38.97403),
        builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.blue,),
        )
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Карта Краснодара'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(2.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Flexible(
                  child: new FlutterMap(
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