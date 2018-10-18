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
  int year;
  int sales;
  charts.Color color;
  Sales(this.year, this.sales, this.color);
}

class _State extends State<MyApp> {
  List<Sales> _data;
  List<charts.Series<Sales, int>> _chartData;

  @override
    void initState() {
      // TODO: implement initState
      _makeData();
    }

  _makeData(){
    _chartData = new List<charts.Series<Sales, int>>();
    _data = <Sales>[
      new Sales(0, 100, charts.MaterialPalette.green.shadeDefault),
      new Sales(1, 89, charts.MaterialPalette.red.shadeDefault),
      new Sales(2, 50, charts.MaterialPalette.blue.shadeDefault),
      new Sales(3, 16, charts.MaterialPalette.teal.shadeDefault),
      new Sales(4, 4, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartData.add(new charts.Series(
      id: "sales",
      data: _data,
      domainFn: (Sales sale,__) => sale.year,
      measureFn: (Sales sale,__) => sale.sales,
      colorFn: (Sales sale,__) => sale.color,
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
              new Text('Pie Chart'),
              new Expanded(child: new charts.PieChart(_chartData, animate: true, animationDuration: new Duration(seconds: 6),)),
            ],
          ),
        ),
      ),
    );
  }
}
