import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoe
  List<Shoe> shoeShop = [
    Shoe(
      name: "Neat beans",
      price: "89.99€",
      imagepath: "lib/shoppingApp/images/sneaker_beige.jpg",
      description: '"React shoes, neat for your beans"'),
    Shoe(
      name: "Atom Black",
      price: "79.99€",
      imagepath: "lib/shoppingApp/images/sneaker_black.jpg",
      description: '"Atomical perfection for your feet"'),
    Shoe(
      name: "Eclipse White",
      price: "84.99€",
      imagepath: "lib/shoppingApp/images/sneaker_white.jpg",
      description: '"Brighter than the Sun, better than a cup of Java"'),
    Shoe(
      name: "Studio Visual Red",
      price: "99.99€",
      imagepath: "lib/shoppingApp/images/sneakers_red.png",
      description: '"Spring into anything with these bootstraps"'),
  ];
  //list of cart items
  List<Shoe> userCart = [];

  //get shoe list
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get user cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add cart item
  void addShoe(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove cart item
  void removeShoe(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

}