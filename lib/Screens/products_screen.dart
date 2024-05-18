import 'dart:io';

import 'package:flutter/material.dart';
import 'package:products_app/Controller/Provider/product_provider.dart';
import 'package:products_app/Screens/customer_screen.dart';
import 'package:products_app/Utils/constants.dart';
import 'package:products_app/Widgets/cart_icon.dart';
import 'package:products_app/Widgets/leading_icon.dart';
import 'package:provider/provider.dart';

import '../Controller/Api Integration/get_product_api.dart';
import '../Controller/Provider/cart_provider.dart';
import '../Model/hive_model_class.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  File? file;

  @override
  Widget build(BuildContext context) {
        final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Products",
            style: lightGreenLargeFont,
          ),
          actions: [ShoppingCart()],
          leading: LeadingIcon()),
      body: SafeArea(
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FutureBuilder(
                    future: fetchProductsData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasData) {
                        return Expanded(
                          child: GridView.builder(
                              itemCount: snapshot.data["data"].length,
                              itemBuilder: (context, index) {
                                final data = snapshot.data["data"][index];
                                // file = File(data["image"].path);

                                return Card(
                                  child: Container(
                                    height:
                                    MediaQuery
                                        .sizeOf(context)
                                        .height * .3,
                                    width: MediaQuery
                                        .sizeOf(context)
                                        .width / 6,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        boxShadow: [
                                          BoxShadow(color: Colors.white)
                                        ]),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Image(
                                                height: 80,
                                                width: 80,
                                                image: NetworkImage(
                                                    "${baseUrl + data["image"]}"),
                                              )),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Text(
                                              data["name"],
                                              style: TextStyle(
                                                  color: Colors.lightGreen.shade800,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Row(
                                              children: [
                                            Text("\$${data["price"].toString()}",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .lightGreen.shade800,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  "/kg",
                                                  style: TextStyle(
                                                      color: Colors.grey.shade400,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 19),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(mainAxisAlignment: MainAxisAlignment
                                              .end,
                                            children: [

                                              InkWell(
                                                onTap: () {
                                                  //Adding items to cart
                                                  CartItem newItem =  CartItem(id:data["id"].toString(), itemName: data["name"], price: data["price"].toDouble(), image: data["image"]);
                                                  cartProvider.addToCart(
                                                      context, newItem);

                                                },
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: [
                                                              Colors.lightGreen,
                                                              Colors.green
                                                                  .shade500
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
                                            ],
                                          ),
                                          //
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4)),
                        );
                      } else {
                        return Text("No data to display");
                      }
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    width: MediaQuery
                        .sizeOf(context)
                        .width,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                              '\$${45}',
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
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return CustomerScreen();}));
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery
                                .sizeOf(context)
                                .width / 2,
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
              ]),

      ),
    );
  }
}
