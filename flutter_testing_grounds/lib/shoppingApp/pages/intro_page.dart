import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/shoppingApp/images/logo.png'),
            ),
            const SizedBox(height: 20,),
            //title
            const Text(
              "Running shoes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              ),
            const SizedBox(height: 20,),
            //subtitle
            Text(
              "The cheapest shoes for the best run",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20,),
            //start button
          ],
        ),
      ),
    );
  }
}