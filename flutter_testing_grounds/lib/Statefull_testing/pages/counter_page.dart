import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State <CounterPage> createState() =>  CounterPageState();
}

class  CounterPageState extends State <CounterPage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Taps: "),
            Text(
              _counter.toString(),
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            ElevatedButton(onPressed: _incrementCounter, child: Text("1+"))
          ],
        ),
      ),
    );
  }
}