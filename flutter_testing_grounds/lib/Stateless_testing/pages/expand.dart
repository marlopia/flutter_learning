import 'package:flutter/material.dart';

class Expand extends StatelessWidget {
  const Expand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expand Test"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),

          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 255, 112, 102),
            ),
          ),

          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 248, 148, 141),
            ),
          ),
        ],
      ),
    );
  }
}