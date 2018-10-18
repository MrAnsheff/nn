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
  List<Sales> _desctops;
  List<Sales> _navigators;
  List<charts.Series<Sales, String>> _chartData;

  @override
    void initState() {
      // TODO: implement initState
      _makeData();
    }

    void _makeData(){

      _desctops = new List<Sales>();
      _navigators = new List<Sales>();
      _chartData = new List<charts.Series<Sales, String>>();

      var rnd = new Random();

      for(int i = 2014; i<2019; i++){
        _desctops.add(new Sales(i.toString(), rnd.nextInt(1000) ));
        _navigators.add(new Sales(i.toString(), rnd.nextInt(1000) ));
      }

      _chartData.add(new charts.Series(
        data: _desctops,
        id: "desctops",
        domainFn: (Sales sale,__) => sale.year,
        measureFn: (Sales sale,__) => sale.sales,
        displayName: "Desctops",
        colorFn: (_,__) => charts.MaterialPalette.purple.shadeDefault,
      ));

      _chartData.add(new charts.Series(
        data: _navigators,
        id: "navigators",
        domainFn: (Sales sale,__) => sale.year,
        measureFn: (Sales sale,__) => sale.sales,
        displayName: "Desctops",
        colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
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
              new Expanded(child: new charts.BarChart(_chartData, vertical: false,)),
            ],
          ),
        ),
      ),
    );
  }
}
