import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //search bar
        SearchBar(),
        //message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            "Shoes shoes shoes!",
            style: TextStyle(color: Colors.grey.shade800),
          ),
        ),
        //offers
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Text(
                "Top Offers!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
