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
  List<LatLng> coords;
  List<Marker> markers;
  MapController controller;

  @override
  void initState(){
    coords = new List<LatLng>();
    controller = new MapController();
    coords.add(new LatLng(45.17284, 38.87403));
    coords.add(new LatLng(45.16284, 38.88403));
    coords.add(new LatLng(45.19284, 38.85403));

    markers = new List<Marker>();

    for(var i = 0; i<coords.length; i++){
      markers.add(
        new Marker(
          height: 80.0,
          width: 80.0,
          point: coords.elementAt(i),
          builder: (ctx) => new Icon(Icons.pin_drop, color: Colors.blue),
        )
      );
    }

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
              
              new Flexible(
                  child: new FlutterMap(
                    mapController: controller,
                    options: new MapOptions(
                      center: new LatLng(45.07284, 38.97403),
                      zoom: 11.0
                    ),
                    layers: [
                      new TileLayerOptions(
                        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a','b','c'],
                      ),
                      new MarkerLayerOptions(markers: markers),
                      new PolylineLayerOptions(polylines: [new Polyline(points: coords, color: Colors.green, strokeWidth: 4.0)]),
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