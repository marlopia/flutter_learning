import 'package:flutter/material.dart';
import 'package:flutter_testing_grounds/shoppingApp/components/shoe_tile.dart';
import 'package:flutter_testing_grounds/shoppingApp/models/shoe.dart';
import 'package:flutter_testing_grounds/shoppingApp/models/cart.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe) {
    //add shoe to cart
    Provider.of<Cart>(context, listen: false).addShoe(shoe);
    //alert user
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("${shoe.name} added to cart!"),
      content: Text("Check your cart!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(viewportFraction: 0.9);

    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SearchBar(),
          ),
          //message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Shoes shoes shoes!",
              style: TextStyle(color: Colors.grey.shade800),
            ),
          ),
          //offers
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Top Offers!🏷️",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 450,
                child: PageView.builder(
                  controller: controller,
                  itemCount: value.getShoeList().length,
                  itemBuilder: (context, index) {
                    Shoe shoe = value.getShoeList()[index];
                    return Align(
                      alignment: Alignment.topCenter,
                      child: ShoeTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe)),
                        );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
