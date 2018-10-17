import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => new _State();
}

class Sales{
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _State extends State<MyApp> {
  List<Sales> _data;
  List<charts.Series<Sales, String>> _chartData;

  @override
    void initState() {
      // TODO: implement initState
      _makeData();
    }

    void _makeData(){
      _data = new List<Sales>();
      _chartData = new List<charts.Series<Sales, String>>();

      var rnd = new Random();
      for(var i = 2010; i<2019 ; i ++){
        _data.add(new Sales(i.toString(), rnd.nextInt(1000)));
      }
      
      _chartData.add(new charts.Series(
        id: "Sales",
        data: _data,
        colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Sales sales,__) => sales.year,
        measureFn: (Sales sales,__) => sales.sales,
        fillPatternFn: (_,__) => charts.FillPatternType.solid,
        displayName: "sales",
      ));

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
            children: <Widget>[
              new Text('Chart is here'),
              new Expanded(child: new charts.BarChart(_chartData)),
            ],
          ),
        ),
      ),
    );
  }
}
