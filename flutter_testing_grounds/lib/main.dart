import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/pages/column_square.dart';
import 'package:flutter_testing_grounds/pages/first_page.dart';
import 'package:flutter_testing_grounds/pages/btm_nav.dart';
import 'package:flutter_testing_grounds/pages/horizontal_listview.dart';
import 'package:flutter_testing_grounds/pages/row_square.dart';
import 'package:flutter_testing_grounds/pages/expand.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/main': (context) => const HomePage(),
        '/firstPage': (context) => const FirstPage(),
        '/btmNav': (context) => const BtmNav(),
        '/clmSqr': (context) => const ColumnSquare(),
        '/rowSqr': (context) => const RowSquare(),
        '/expand': (context) => const Expand(),
        '/hlistview': (context) => const HorizontalListview(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _taps = 0; // State variable to track taps

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text("Sandbox App"),
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        leading: const Icon(Icons.bug_report),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _taps += 1; // Increment tap count on tap
            });
          },
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 177, 134, 7),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tap Me!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _taps.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Icon(Icons.favorite, color: Colors.red, size: 40),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/firstPage');
                  },
                  child: const Text("Let's Start!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
