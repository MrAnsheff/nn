import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:io/io.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;
Permission permissionFromString(String value) {
  Permission permission;
  for (var item in Permission.values) {
    if (item.toString() == value) {
      permission = item;
      break;
    }
  }
  return permission;
}

void main() async {
  cameras = await availableCameras();

  await SimplePermissions.requestPermission(
      permissionFromString('Permission.Camera'));
  await SimplePermissions.requestPermission(
      permissionFromString('Permission.WriteExternalStorage'));

  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() => new _State();
}

class _State extends State<MyApp> {
  GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
  CameraController controller;
  Permission _permissionCamera;
  Permission _permissionStorage;

  Future<String> savePhoto() async{
    String timeStamp = new DateTime.now().millisecondsSinceEpoch.toString();
    String filePath = '/storage/emulated/0/Pictures/$timeStamp.jpg';

    if(controller.value.isTakingPicture) return null;
    try{
      await controller.takePicture(filePath);
    } on CameraException catch(e){
      _snackBar(e.toString());
    }

    return filePath;

  }

  void takePhoto() async{
    bool hasCamera = await SimplePermissions.checkPermission(_permissionCamera);
    bool hasStorage = await SimplePermissions.checkPermission(_permissionStorage);
    if(!hasCamera || !hasStorage){
      _snackBar("Lacking permissions");
      return;
    }

    savePhoto().then((String filePath){
      if(mounted && filePath != null) _snackBar('Photo saved to $filePath');
    });
  }

  void _snackBar(String value) {
    _scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  @override
  void initState() {
    super.initState();
    controller = new CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        // Do what we want
      });
    });

    _permissionCamera = permissionFromString('Permission.Camera');
    _permissionStorage = permissionFromString('Permission.WriteExternalStorage');
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldState,
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(onPressed: takePhoto, child: Text('Take Photo')),
                    RaisedButton(
                        onPressed: () => SimplePermissions.openSettings(),
                        child: Text('Permissions')),
                  ]),
              AspectRatio(aspectRatio: 1.0, child: new CameraPreview(controller),),
            ],
          ),
        ),
      ),
    );
  }
}
