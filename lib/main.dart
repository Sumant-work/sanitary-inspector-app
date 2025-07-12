
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanitary Inspector App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text('Sanitary Inspector App')),
        body: Center(child: Text('Welcome to the Sanitary Inspector App')),
      ),
    );
  }
}
