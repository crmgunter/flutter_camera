import 'package:flutter/material.dart';

void main() {

  final barColor = const Color(0xFFD63031);
  final bgColor = const Color(0xFF8395A7);

  var app = MaterialApp(home: Scaffold(
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.build, color: bgColor),
      backgroundColor: barColor,
      onPressed: () {},
    ),
    backgroundColor: bgColor,
    appBar: AppBar(
      title: Text('Instagram'),
      backgroundColor: barColor,
    ),
  ));

  runApp(app);
}
