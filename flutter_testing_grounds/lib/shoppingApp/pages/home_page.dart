import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/shoppingApp/components/bottom_nav_bar.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/cart_page.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/logout_page.dart';
import 'package:flutter_testing_grounds/shoppingApp/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //selected navbar index
  int _selectedIndex = 0;

  //navbar function
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //navbar pages
  final List<Widget> _pages = [
    //shop
    const ShopPage(),
    //cart
    const CartPage(),
    //logout
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
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Colors.black,
            ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[600],
        child: Column(
          children: [
            //logo
            DrawerHeader(
              child: Image.asset('lib/shoppingApp/images/logo.png', color: Colors.white,),
              ),
            //other pages
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Home", style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text("About", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}