import 'dart:ui';

import 'package:flutter/material.dart';


class MainMenuScaffold extends State<MainMenuState> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            children: <Widget>[
              new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hallo,", style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Benutzer", style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ]
              ),
              new Column(children: <Widget>[
                new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 100),
                      IconButton(onPressed: settings(), icon: Icon(
                        Icons.settings,
                      ),
                      ),
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Your Garage'),
                      IconButton(onPressed: lookIntoCar(), icon: ImageIcon(
                        AssetImage('assets/Example_car.jpg'),
                        size: 200,
                      ),
                      ),
                    ]
                ),
              ]
              ),
            ]
        ),
      ),
    );
  }

  settings() {}

  lookIntoCar() {}
}