import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/InputFields/pages/inputTest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputTest(),
    );
  }
}