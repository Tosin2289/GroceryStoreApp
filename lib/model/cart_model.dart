import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopitems = [
    ["Avocado", "4.00", "assets/avocado.png", Colors.green],
    ["Banana", "2.50", "assets/banana.png", Colors.yellow],
    ["Chicken", "12.80", "assets/chicken.png", Colors.brown],
    ["Water", "1.00", "assets/water.png", Colors.blue],
  ];
  List _cartItems = [];

  get shopItems => _shopitems;

  get cartitems => _cartItems;
//add item
  void addItemToCart(int index) {
    _cartItems.add(_shopitems[index]);
    notifyListeners();
  }

//remove item
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

//total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
