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

class AnimatedLogo extends AnimatedWidget{

  final _opacityTween = new Tween(begin: 0.1, end: 1.0);
  final _rotateTween = new Tween(begin: 0.0, end: 12.0);
  final _sizeTween = new Tween(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  Widget build(BuildContext context){
    final Animation<double> animation = listenable;
    return new Transform.rotate(angle: _rotateTween.evaluate(animation), 
    child: new Opacity(opacity: _opacityTween.evaluate(animation),
    child: new Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      height: _sizeTween.evaluate(animation),
      width: _sizeTween.evaluate(animation),
      child: new Image.asset('images/lan.png'),
    ),
    )
    );

  }
}

class _State extends State<MyApp> with TickerProviderStateMixin{
  Animation animation;
  AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation.addStatusListener(listener);

    controller.forward();
  }

  void listener(AnimationStatus status){
    if(status == AnimationStatus.completed){
      controller.reverse();
    } else if (status == AnimationStatus.dismissed){
      controller.forward();
    }
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
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
          child: new AnimatedLogo(animation: animation),
        ),
      ),
    );
  }
}
