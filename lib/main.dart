import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:contacts_service/contacts_service.dart';

Permission permissionFromString(String value){
  Permission permission;
  for(var item in Permission.values){
    if(item.toString() == value){
      permission = item;
      break;
    }
  }
  return permission;
}

void main() async{

  await SimplePermissions.requestPermission(permissionFromString('Permission.ReadContacts'));
  await SimplePermissions.requestPermission(permissionFromString('Permission.WriteContacts'));
  
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

  void _create() async{
    Contact contact = new Contact(familyName: "Shevelev", givenName: "Anton", phones: [new Item(label: 'Home', value: '+79000000112')]);
    ContactsService.addContact(contact);
    _snackBar('Contact created');

  }

  void _find() async{
    Iterable<Contact> people = await ContactsService.getContacts(query: "Anton");
    _snackBar("There are ${people.length} people named Anton");
  }

  void _read() async{
    Iterable<Contact> people = await ContactsService.getContacts(query: "Anton");
    Contact contact = people.first;
    _snackBar("Antons phone is ${contact.phones.first.value}");
  }

  void _delete() async{
    Iterable<Contact> people = await ContactsService.getContacts(query: "Anton");
    Contact contact = people.first;
    ContactsService.deleteContact(contact);
    _snackBar("Contact deleted");
    
  }

  void _snackBar(String value){
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(value),));
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
              RaisedButton(onPressed: _create, child: Text('Create')),
              RaisedButton(onPressed: _find, child: Text('Find')),
              RaisedButton(onPressed: _read, child: Text('Read')),
              RaisedButton(onPressed: _delete, child: Text('Delete')),
              RaisedButton(onPressed: () => SimplePermissions.openSettings(), child: Text('Permissions')),
            ],
          ),
        ),
      ),
    );
  }
}
