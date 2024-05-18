import 'package:flutter/material.dart';
import 'package:products_app/Screens/cart_screen.dart';
class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CartScreen();
          }));
        },
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.lightGreen.shade800,
          size: 28,
        ));

  }
}


