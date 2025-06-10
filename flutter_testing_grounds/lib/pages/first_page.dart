import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Starting Page"),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurpleAccent,
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.folder, size: 45, color: Colors.deepPurple),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME", style: TextStyle(fontSize: 15) ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/main');
              },
            ),

            ListTile(
              leading: Icon(Icons.square, size: 45, color: Colors.deepPurple),
              title: Text("Column Squares", style: TextStyle(fontSize: 15) ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/clmSqr');
              },
            ),

            ListTile(
              leading: Icon(Icons.square_rounded, size: 45, color: Colors.deepPurple),
              title: Text("Row Squares", style: TextStyle(fontSize: 15) ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/rowSqr');
              },
            ),

            ListTile(
              leading: Icon(Icons.arrow_outward, size: 45, color: Colors.deepPurple),
              title: Text("Expand", style: TextStyle(fontSize: 15) ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/expand');
              },
            ),

            ListTile(
              leading: Icon(Icons.arrow_right, size: 45, color: Colors.deepPurple),
              title: Text("ListView", style: TextStyle(fontSize: 15) ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/hlistview'); 
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text("<- Drawer test", style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/btmNav');
              },
              child: Text("Test Bottom Navigator Bar"),
            ),
          ],
        ),
      ),
    );
  }
}
