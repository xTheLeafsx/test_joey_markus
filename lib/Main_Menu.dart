import 'dart:ui';

import 'package:flutter/material.dart';

void main(){
  runApp(Login_Generator());
}

class Login_Generator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safety Car',
      theme: ThemeData(
        backgroundColor: Colors.cyanAccent
      ),
      home : Login()
    );
  }
}

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Login_StateGenerator();
}

class Login_StateGenerator extends State<Login>{
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
            TextButton(onPressed: (){tryToLogin(_username, _password);}, child: const Text("Einloggen"))
          ]
      ),
      ),
    );
  }

  void tryToLogin(String username, String password) {
    if(_password=="admin") {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (BuildContext context) {
          final _username = username;
          final _password = password;
          return Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('nfsdbfhss'),
                  ]
              ),
            ),
          );
        }),
      );
    }
  }
}