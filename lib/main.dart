import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';

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
  String status;
  Permission permission;

  @override
  void initState(){
    super.initState();
    status = "Please choice the permission";
    print(Permission.values);
  }

  checkPermission() async{
    final res = await SimplePermissions.checkPermission(permission);
    setState((){
      status = "${permission.toString()} = ${res.toString()}";
    });
  }

  requestPermission() async{
    final res = await SimplePermissions.requestPermission(permission);
    setState((){
      status = "${permission.toString()} = ${res.toString()}";
    });
  }

  getPermissionStatus() async{
    final res = await SimplePermissions.getPermissionStatus(permission);
    setState((){
      status = "${permission.toString()} = ${res.toString()}";
    });
  }

  onDropdownChanged(Permission permission){
    setState((){
      this.permission = permission;
      status = "Click a button below";
    });

  }

  List<DropdownMenuItem<Permission>> _getDropdownMenu(){
    List<DropdownMenuItem<Permission>> items = new List<DropdownMenuItem<Permission>>();
    Permission.values.forEach((permission){
      var item = new DropdownMenuItem(child: Text(getPermissionString(permission)), value: permission,);
      items.add(item);
    });
    return items;
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
              new Text(status),
              DropdownButton(items: _getDropdownMenu(), onChanged: onDropdownChanged, value: permission,),
              RaisedButton(onPressed: checkPermission, child: Text("Check Permission")),
              RaisedButton(onPressed: requestPermission, child: Text("Request Permission")),
              RaisedButton(onPressed: getPermissionStatus, child: Text("Get Status")),
              RaisedButton(onPressed: SimplePermissions.openSettings, child: Text("Open Settings")),
            ],
          ),
        ),
      ),
    );
  }
}
