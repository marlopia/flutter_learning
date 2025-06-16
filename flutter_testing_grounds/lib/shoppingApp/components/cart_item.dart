import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/shoppingApp/models/shoe.dart';
import 'package:flutter_testing_grounds/shoppingApp/models/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove cart item
  void removeFromCart () {
    Provider.of<Cart>(context, listen: false).removeShoe(widget.shoe);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagepath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          onPressed: removeFromCart,
          icon: Icon(Icons.delete)
          ),
      ),
    );
  }
}