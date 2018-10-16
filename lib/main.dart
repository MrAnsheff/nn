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

class _State extends State<MyApp> {
  List<Step> _steps;
  int _current;

  @override
    void initState() {
      // TODO: implement initState
      _current = 0;
        _steps = <Step>[
    new Step(title: new Text('Step 1'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 2'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 3'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 1'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 2'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 3'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 1'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 2'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 3'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 1'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 2'), content: new Text('Doing Something'), isActive: true),
    new Step(title: new Text('Step 3'), content: new Text('Doing Something'), isActive: true),
  ];
    }
  
  void _stepContinue(){
    setState(() {
          _current++;
          if(_current >= _steps.length) _current = _steps.length -1; 
        });

  }

  void _stepCancel(){
    setState(() {
          _current--;
          if(_current < 0) _current = 0; 
        });
  }

  void _onTapped(int index){
        setState(() {
          _current = index;
           
        });

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
          child: new Stepper(
            steps: _steps,
            currentStep: _current,
            onStepContinue: _stepContinue,
            onStepCancel: _stepCancel,
            onStepTapped: _onTapped,
            )
        ),
      ),
    );
  }
}
