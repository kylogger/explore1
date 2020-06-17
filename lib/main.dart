import 'package:explore1/startscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Explore());
}

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Explore 1'),
        ),
        body: StartScreen()
      ),
    );
  }
}






