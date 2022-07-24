import 'package:flutter/material.dart';

void main(){
  runApp(Main_Menu());
}

class Main_Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
              child: Image(
                  image: AssetImage('Source/Logo.jpeg'),
                height: 400,
                width: 400,
                alignment: Alignment(0.0, -0.5),
              ),
          ),
      ),
    );
  }
}