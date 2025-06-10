import 'package:flutter/material.dart';

class InputTest extends StatefulWidget {
  const InputTest({super.key});

  @override
  State<InputTest> createState() => _InputTestState();
}

class _InputTestState extends State<InputTest> {
  TextEditingController myController = TextEditingController();

  String greetingMessage = "";

  void greetUser() {
    setState(() {
      greetingMessage = "Hello ${myController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greetingMessage),

              TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
              ),

              ElevatedButton(onPressed: greetUser, child: Text("Tap"))
            ],
          ),
        ),
      ),
    );
  }
}