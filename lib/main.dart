import 'package:flutter/material.dart';
import 'package:outlay/screens/home/home.dart';

void main(List<String> args) {
  runApp(const Outlay());
}

class Outlay extends StatelessWidget {
  const Outlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const Home(),
    );
  }
}
