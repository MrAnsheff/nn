import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => new _ClockState();
}

class _ClockState extends State<Clock> {
  String _value = "Time here";
  Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    _timer = new Timer.periodic(new Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer timer) {
    var now = new DateTime.now();
    var formatter = new DateFormat("hh:mm:ss");
    var formatted = formatter.format(now);
    setState(() {
      _value = formatted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Text(_value, style: new TextStyle(fontSize: 55.0),);
  }
}
