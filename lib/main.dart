import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Map _countries = new Map();



  void _getCountries() async {
    var url = "http://country.io/names.json";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _countries = json.decode(response.body);
        print(_countries.length);
      });
    }
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
          child: new ListView.builder(
            itemCount: _countries.length,
            itemBuilder: (BuildContext context, int index){
              String key = _countries.keys.elementAt(index);
              return Card(
                child: new Container(
                  padding: EdgeInsets.all(32.0),
                  child: new Text('$key : ${_countries[key]}'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

   
 @override 
 void initState() {
     // TODO: implement initState
     _getCountries();
   }
   
}
