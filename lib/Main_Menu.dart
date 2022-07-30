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
              image: AssetImage('assets/Logo_round.png'),
              height: 170,
              width: 170,
            ),
            const SizedBox(height: 10), //Test
            Text('SafetyCar'),
            const SizedBox(height: 120), //Test
            TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              selectionWidthStyle: BoxWidthStyle(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'username'
              ),
              onSubmitted: (String value) async{_username = value;},
            ),
            const SizedBox(height: 15), //Test
            TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password'
              ),
              onSubmitted: (String value) async{_password = value;},
            ),
            TextButton(onPressed: (){tryToLogin(_username, _password, context);}, child: const Text("Einloggen")),
          ]
      ),
      ),
    );
  }

  void tryToLogin(String username, String password, BuildContext context) {
      final String _username = username;
      String _password = 'Furz';
      _password = password;
      String out = "Main Menu$_password";
      //if(_password=='admin') {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(out),
                  ]
              ),
            ),
          );
        }),
      );
    //}
  }
}