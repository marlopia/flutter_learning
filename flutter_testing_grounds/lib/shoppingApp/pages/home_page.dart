import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/shoppingApp/components/bottom_nav_bar.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/cart_page.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/intro_page.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/logout_page.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/shop_page.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/about_page.dart'; // Asegúrate de tener esta página creada

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
    const LogoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[600],
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/shoppingApp/images/logo.png',
                color: Colors.white,
              ),
            ),

            // HOME
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title: const Text("Home", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const IntroPage()),
                  );
                },
              ),
            ),

            // ABOUT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: const Icon(Icons.info, color: Colors.white),
                title: const Text("About", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
