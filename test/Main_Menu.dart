import 'package:flutter/material.dart';

void main(){
  runApp(Main_Menu());
}

class Main_Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Main Menu',
        home: Scaffold(
            child: Ink.image(image: image),
          ),
        ),
    );
  }
}