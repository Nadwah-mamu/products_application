import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../Model/hive_model_class.dart';

class CartProvider extends ChangeNotifier{
  //

  final Box cartBox = Hive.box('hive_cart');

  List<dynamic> get cartItemsList => cartBox.values.toList();


  //Adding items to cart/

  void addToCart(BuildContext context, CartItem item) {
    cartBox.add(item);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.lightGreen.shade800,
        content: Text(
          "Your Product is added to cart",
          style: TextStyle(color: Colors.white),
        )));
    print("length is ${cartBox.length}");
    notifyListeners();
  }


  double totalForProduct(CartItem item) {
    return item.price! * item.quantity!;
  }


  void updateQuantity(CartItem item, int quantity) {
    item.quantity = quantity;
    item.save();
    notifyListeners();
  }

  double get subtotal {
    double total = 0.0;
    for (var item in cartItemsList) {
      total += item.price * item.quantity;
    }
    return total;
  }


  void removeProduct(CartItem item) {
    cartBox.delete(item.id);
    notifyListeners();
  }

  clearData(BuildContext context,){
    cartBox.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.lightGreen.shade800,
        duration: Duration(seconds: 2),
        showCloseIcon: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Text(
          "Your Order is successful",
          style: TextStyle(color: Colors.white,fontSize: 25),
        )));

    notifyListeners();
  }

}