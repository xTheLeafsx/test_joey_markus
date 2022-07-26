import 'dart:ui';

import 'package:flutter/material.dart';

void main(){
  runApp(MainMenu_Generator());
}

class MainMenu_Generator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safety Car',
      theme: ThemeData(
        backgroundColor: Colors.cyanAccent
      ),
      home : MainMenu()
    );
  }
}

class MainMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MainMenu_StateGenerator();
}

class MainMenu_StateGenerator extends State<MainMenu>{
  String _username = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/Logo_round.jpeg'),
              height: 170,
              width: 170,
            ),
            const SizedBox(height: 5), //Test
            Text('SafetyCar'),
            const SizedBox(height: 20), //Test
            TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Benutzername'
              ),
              onSubmitted: (String value) async{_username = value;},
            ),
            const SizedBox(height: 5), //Test
            TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Passwort'
              ),
              onSubmitted: (String value) async{_password = value;},
            ),
          ]
      ),
      ),
    );
  }
}