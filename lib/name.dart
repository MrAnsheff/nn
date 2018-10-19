import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  Name({Key key, this.name});
  final ValueChanged<String> name;
  @override
  _NameState createState() => new _NameState(name: name);
}

class _NameState extends State<Name> {
  _NameState({Key key, this.name});
  final ValueChanged<String> name;
  TextEditingController text;

  void _onChanged(String value) {

      name(value);

  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new TextField(
        controller: text,
        onChanged: _onChanged,
      ),
    );
  }
}
