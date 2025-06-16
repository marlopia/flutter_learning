import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/shoppingApp/components/cart_item.dart';
import 'package:flutter_testing_grounds/shoppingApp/models/cart.dart';
import 'package:flutter_testing_grounds/shoppingApp/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context,value,child) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //Header
            Text(
              "My Cart 🛒",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              ),
            SizedBox(height: 10,),
            //Cart Items
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context,index) {
                  //get shoe item
                  Shoe aShoe = value.getUserCart()[index];
                  //return cart
                  return CartItem(shoe: aShoe);
                }),
            ),
          ],
        ),
      ),
      );
  }
}