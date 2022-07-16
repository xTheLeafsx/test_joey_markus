import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myCar - die Verwaltungsapp für Dein Auto!',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0x69292929),
      ),
      home: const MyHomePage(title: 'myCar - die Verwaltungsapp für Dein Auto!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
        DetailPage(headline: 'Heute', daysInPast: 0),
        DetailPage(headline: 'Gestern', daysInPast: 1),
          DetailPage(headline: 'Vorgestern', daysInPast: 2),
      ],)
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.headline, required this.daysInPast }) : super(key: key);

  final String headline;
  final int daysInPast;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 32.0),
      child: Column(children: [
        Text(widget.headline, style: const TextStyle(fontSize: 48.0, color: Colors.white)),
         TrackingElement(color: const Color(0x2496EA05), iconData: Icons.directions_run, unit: 'Steps', max: 5000, daysInPast: widget.daysInPast,),
         TrackingElement(color: const Color(0xF913D7A3), iconData: Icons.local_drink, unit: 'l', max: 3, daysInPast: widget.daysInPast,),
         TrackingElement(color: const Color(0xDD811285), iconData: Icons.fastfood, unit: 'pieces', max: 1800, daysInPast: widget.daysInPast,),
      ],),
    );
  }
}


class TrackingElement extends StatefulWidget {
  const TrackingElement({Key? key, required this.color, required this.iconData, 
    required this.unit, required this.max, required this.daysInPast }) : super(key: key);

  final Color color;
  final IconData iconData;
  final String unit;
  final double max;
  final int daysInPast;
  
  @override
  State<TrackingElement> createState() => _TrackingElementState();
}

class _TrackingElementState extends State<TrackingElement> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _counter = 0;
  double _progress = 0;
  var now = DateTime.now();
String _storageKey ='';

   _incrementCounter() async {
  setState(() {
      _counter += 200;
      _progress = _counter / widget.max;
  });
  (await _prefs).setInt(_storageKey, _counter);
  }
  @override
  void initState() async {
     super.initState();

      _storageKey = '${now.year}-${now.month}-${now.day - widget.daysInPast} ${widget.unit}';

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
     _prefs.then( (prefs) {
      setState(()
      {_counter = prefs.getInt(_storageKey) ?? 0;
      _progress = _counter / widget.max;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
     return InkWell(
        onTap: _incrementCounter(),
        child: Column(
      children:  <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(32.0, 64.0, 32.0, 24.0),
          child: Row(children: <Widget>[
            Icon(widget.iconData, color: Colors.white70, size: 50),
            Text(
                '$_counter.toString() / ${widget.max.toInt()} $widget.unit',
                style: const TextStyle(color: Colors.white70, fontSize: 32)
            ),
          ],),
        ),
        LinearProgressIndicator(
          value: _progress,
          color: widget.color,
          backgroundColor: const Color(0xC7EEF3EC),
          minHeight: 12.0,
        )
      ],
    ),);
  }
}

