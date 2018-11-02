import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

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
  void _showUrl(){
    _launcher("http://ya.ru");
  }

  void _showEmail(){
    _launcher("mailto:ansheff@bk.ru");
  }

  void _showPhone(){
    _launcher("tel:89000000112");
  }

  void _showSms(){
    _launcher("sms:89000000112");
  }

  void _launcher(String smth) async{
    if(await canLaunch(smth)){
      await launch(smth);
    } else {
      throw "We cant run this url";
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
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: _showUrl, child: Text('URL')),
              RaisedButton(onPressed: _showEmail, child: Text('E-MAIL')),
              RaisedButton(onPressed: _showPhone, child: Text('PHONE')),
              RaisedButton(onPressed: _showSms, child: Text('SMS')),
              
            ],
          ),
        ),
      ),
    );
  }
}
