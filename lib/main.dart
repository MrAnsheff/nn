import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum Action { Increment, Decrement }

int reducer(int state, dynamic action) {
  if (action == Action.Increment) state++;
  if (action == Action.Decrement) state--;
  return state;
}

void main() {
  final store = new Store<int>(reducer, initialState: 0);
  runApp(
    new MyApp(store: store),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key key, this.store});
  final Store<int> store;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: "Reudux Testing",
        home: new Scaffold(
          appBar: new AppBar(
            title: Text('Flutter Redux'),
          ),
          body: new Container(
            padding: EdgeInsets.all(32.0),
            child: new Center(
              child: new Column(
                children: <Widget>[

                  new StoreConnector<int, String>(
                    builder: (BuildContext context, count) => new Text(
                          count,
                          style: new TextStyle(fontSize: 32.0),
                        ),
                    converter: (store) => store.state.toString(),
                  ),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.add), onPressed: () => store.dispatch(Action.Increment),),
                      new IconButton(icon: Icon(Icons.remove), onPressed: () => store.dispatch(Action.Decrement),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
