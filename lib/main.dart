import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => new _State();
}

class MyButton extends AnimatedWidget{
  bool large = false;
  static final _sizeTween = new Tween(begin: 1.0, end: 2.0);
  AnimationController controller;
  MyButton({Key key, Animation<double> animation, AnimationController controller}): super(key: key, listenable: animation)
  {
    this.controller = controller;
  }

  void _press(){
    if(large == false){
      controller.forward();
      large = true;
    } else if(large = true) {
      controller.reverse();
      large = false;
    }
  }

  Widget build(BuildContext context){
    Animation animation = listenable;
    return Transform.scale(scale: _sizeTween.evaluate(animation),
    child: RaisedButton(child: Text('Press Me'), onPressed: _press,)
    );
  }
}

class _State extends State<MyApp> with TickerProviderStateMixin{
  Animation animation;
  AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
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
              new Text('All Widgets Here'),
              new MyButton(animation: animation, controller: controller,)
            ],
          ),
        ),
      ),
    );
  }
}
