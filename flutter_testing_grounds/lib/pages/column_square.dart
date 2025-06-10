import 'package:flutter/material.dart';

class ColumnSquare extends StatelessWidget {
  const ColumnSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Test"),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            color: Colors.red,
          ),

          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 255, 112, 102),
          ),

          Container(
            height: 100,
            width: 100,
            color: const Color.fromARGB(255, 248, 148, 141),
          ),
        ],
      ),
    );
  }
}