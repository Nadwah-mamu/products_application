import 'package:flutter/material.dart';
import 'package:products_app/Controller/Api%20Integration/post_order_products.dart';
import 'package:products_app/Utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/Provider/cart_provider.dart';
import '../Model/hive_model_class.dart';
import '../Widgets/bottom_navigation_bar.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List cartItems2 = Provider.of<CartProvider>(context).cartItemsList;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade50,
          title: Text(
            "My Cart",
            style: lightGreenLargeFont,
          ),
          centerTitle: true,
          // leading: LeadingIcon(),
        ),
        body: Consumer<CartProvider>(
            builder: (BuildContext context, CartProvider value, Widget? child) {

          return value.cartBox.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Cart is Empty!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Text(
                          "It's a good day to buy the items you saved for later"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return BottomNavigation();
                            }));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.lightGreen.shade500)),
                          child: Text(
                            "SHOP NOW,",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems2.length,
                          itemBuilder: (context, index) {

                            return Card(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.28,
                                            maxHeight: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.28,
                                          ),
                                          child: Image(
                                            height: 80,
                                            width: 80,
                                            image: NetworkImage(
                                                "${baseUrl + cartItems2[index].image}"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              cartItems2[index].itemName,
                                              style: TextStyle(
                                                  color: Colors
                                                      .lightGreen.shade800,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\$${cartItems2[index].price}',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .lightGreen.shade800,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  "/kg",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade400,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15,),

                                      InkWell(
                                        onTap: () {
                                          value.updateQuantity(cartItems2[index], cartItems2[index].quantity! + 1);
                                        },
                                        child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.lightGreen,
                                                      Colors
                                                          .green.shade500
                                                    ]),
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            )),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        cartItems2[index].quantity.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            // Provider.of<CartProvider>(context,listen: false).decrementQuantity(item,item.quantity!);
                                            if (cartItems2[index].quantity! > 1) {
                                              value.updateQuantity(cartItems2[index], cartItems2[index].quantity! - 1);
                                            } else {
                                              value.removeProduct(cartItems2[index]);
                                            }

                                          },
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            color:
                                            Colors.lightGreen.shade800,
                                            size: 28,
                                          )),
                                      SizedBox(width: 8,),
                                      Text("\$${Provider.of<CartProvider>(context).totalForProduct(cartItems2[index]).toString()}",style: TextStyle(
      git                                     color: Colors.lightGreen.shade800,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),)
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          width: MediaQuery.sizeOf(context).width,
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.lightGreen.shade100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "SubTotal",
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '\$${value.subtotal.toString()}',
                                    style: TextStyle(
                                        color: Colors
                                            .lightGreen.shade800,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize: 20),
                                  ),

                                ],
                              ),
                              InkWell(
                                onTap: ()async {
                                  value.clearData(context);
                                  value.cartItemsList.clear();

                                  SharedPreferences prefs=await SharedPreferences.getInstance();
                                  String? customerId=prefs.getString("customer_id");
                                  List product=[];
                                  for( CartItem i in cartItems2){
                                    product.add({"product_id":i.id,"quantity":i.quantity,"price":i.price,});
                                  }
                                  sendOrderDetails(id:customerId,totalPrice: value.subtotal,products: product);


                                },
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.sizeOf(context).width / 2,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        Colors.lightGreen.shade700,
                                        Colors.lightGreen,
                                        Colors.lightGreen.shade700
                                      ]),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      "CHECKOUT NOW",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]);
        }));
  }
}
