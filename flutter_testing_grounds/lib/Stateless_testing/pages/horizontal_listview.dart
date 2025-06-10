import 'package:flutter/material.dart';

class HorizontalListview extends StatelessWidget {
  const HorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal Listview Test"),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
            Container(
              width: 300,
              color: Colors.red,
            ),
            
            Container(
              width: 300,
              color: const Color.fromARGB(255, 255, 112, 102),
            ),
            
            Container(
              width: 300,
              color: const Color.fromARGB(255, 248, 148, 141),
            ),
        ],
      ),
    );
  }
}
// ERROR Incorrect use of ParentDataWidget.