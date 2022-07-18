import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: createStatefulWidget()
    )
  }
}
class createStatefulWidget extends StatefulWidget {  @override
  State<StatefulWidget> createState(){}
}