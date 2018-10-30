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

  class _State extends State<MyApp> with SingleTickerProviderStateMixin{

    Animation animation;
    AnimationController controller;
    @override
    void initState(){
      super.initState();
      controller = new AnimationController(duration: const Duration(milliseconds: 5000),vsync: this);
      final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.easeOut);
      animation = new Tween(begin: 0.0, end: 300.0).animate(curve);

      controller.forward();
    }

    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }

    Widget builder(BuildContext context, Widget widget){
      return new Container(
        height: animation.value,
        width: animation.value,
        child: new Image.asset('images/lan.png'),
      );
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
       child: new AnimatedBuilder(builder: builder, animation: animation,),
      ),
      ),
    );
    }
  }