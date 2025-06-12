import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/ToDoApp/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  // initialize Hive box (db) for memory
  await Hive.initFlutter();
  var box = await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),

      // set backup theme for missing colors
      theme: ThemeData(
        colorSchemeSeed: Colors.amber.shade700,
        useMaterial3: true,
      ),
    );
  }
}