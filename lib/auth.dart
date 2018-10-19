import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  Auth({Key key, this.isAuth});

  final ValueChanged<bool> isAuth;

  @override
  _AuthState createState() => new _AuthState(isAuth: isAuth);
}

class _AuthState extends State<Auth> {
  _AuthState({Key key, this.isAuth});

  final ValueChanged<bool> isAuth;
  TextEditingController _user;
  TextEditingController _pass;

  void onPressed(){
    if(_user.text != "user" || _pass.text != "1234"){
      isAuth(false);
    } else {
      isAuth(true);
    }
  }

  @override
    void initState() {
      // TODO: implement initState
      _user = new TextEditingController();
      _pass = new TextEditingController();
    }
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            new TextField(
              controller: _user,
              decoration: InputDecoration(labelText: "UserName"),
            ),
            new TextField(
              controller: _pass,
              decoration: InputDecoration(labelText: "Password"),
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: onPressed,
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      )
    
    );
  }
}
