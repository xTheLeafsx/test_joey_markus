import 'dart:ui';

import 'package:flutter/material.dart';

void main(){
  runApp(Login_Generator());
}

class GlobalVariables{
  static String password ='';
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
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(220, 220,220,220),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/Logo_round.png'),
              height: 165,
              width: 165,
            ),
            const SizedBox(height: 10), //Test
            Text('Safety Car',style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 120), //Test
            TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
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
              obscureText: !this._showPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.blue : Colors.grey,
                    ),
                    onPressed: ()
                    {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
              ),
              onSubmitted: (String value) async{_password = value;GlobalVariables.password = value;},
            ),
            TextButton(onPressed: (){tryToLogin(_username, _password);}, child: const Text("login")),
          ]
      ),
      ),
    );
  }

  void tryToLogin(String username, String password) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (BuildContext context) {
          final String _username = username;
          final String _password = password;
          if(_password.compareTo('admin')==0) {
            return MainMenuState();
          }else{
            return AlertDialog(
              title: const Text('Wrong Password'),
              content: Text('You entered a wrong password'),
              actions: <Widget>[
                TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Try again')),
              ],
            );
          }
        }),
      );
    //}
  }
}

class MainMenuState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MainMenuScaffold();
}

class MainMenuScaffold extends State<MainMenuState> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            children: <Widget>[
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 300),
                  IconButton(onPressed: settings(), icon: Icon(
                    Icons.settings,
                    ),
                  ),
                ]
              ),
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
      ),
    );
  }

  settings() {}

  lookIntoCar() {}
}