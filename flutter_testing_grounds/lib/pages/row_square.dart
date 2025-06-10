import 'package:flutter/material.dart';

class RowSquare extends StatelessWidget {
  const RowSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Test"),
      ),
      body: Row(
        children: [
          Container(
            height: 700,
            width: 100,
            color: Colors.red,
          ),

          Container(
            height: 600,
            width: 100,
            color: const Color.fromARGB(255, 255, 112, 102),
          ),

          Container(
            height: 500,
            width: 100,
            color: const Color.fromARGB(255, 248, 148, 141),
          ),
        ],
      ),
    );
  }
}