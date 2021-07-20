import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(primaryColor: Colors.indigo, accentColor: Colors.amber),
      home: Text('super'),
    );
  }
}
