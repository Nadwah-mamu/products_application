import 'dart:async';

import 'package:flutter/material.dart';
import 'package:products_app/Controller/Provider/customer_provider.dart';
import 'package:products_app/Screens/cart_screen.dart';
import 'package:products_app/Widgets/circle_avatar.dart';
import 'package:products_app/Widgets/leading_icon.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/Api Integration/get_customer_api.dart';

class CustomerScreen extends StatelessWidget {
  CustomerScreen({Key? key}) : super(key: key);
  TextStyle textStyle = TextStyle(
      color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: EndDrawerButton(),
      appBar: AppBar(
        title: Text(
          "Customers",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [EndDrawerButton()],
        leading: LeadingIcon(),
      ),
      body: Consumer<CustomerProvider>(
        builder: (BuildContext context, CustomerProvider value, Widget? child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: value.customerSearchController,
                  onChanged: value.searchCustomer,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.grey.shade400,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      suffixIcon: Container(
                        height: 30,
                        width: 70,
                        margin: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.qr_code,
                              color: Colors.grey.shade500,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar1(
                              radius: 16,
                              iconData: Icons.add_sharp,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              FutureBuilder(
                  future: fetchCustomerData(value.value),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data["data"].length,
                            itemBuilder: (context, index) {
                              final data = snapshot.data["data"][index];

                              return InkWell(
                                onTap: ()async{
                                  Provider.of<CustomerProvider>(context,listen: false).customerSelection(data["id"].toString());

                                  Navigator.push(context, MaterialPageRoute(builder: (context){return CartScreen();}));

                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.94,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 10,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            child: Image.asset(
                                                "assets/customerImages/women1.jpeg",
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.64,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 2, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(data["name"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 23)),
                                                    SizedBox(
                                                      child: Row(
                                                        children: [
                                                          CircleAvatar1(
                                                            radius: 11,
                                                            iconData:
                                                                Icons.call_sharp,
                                                            size: 12,
                                                          ),
                                                          Icon(
                                                            Icons.chat,
                                                            size: 23,
                                                            color: Colors
                                                                .lightGreen
                                                                .shade500,
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        5, 2, 0, 0),
                                                child: Row(
                                                  children: [
                                                    Text('ID : ',
                                                        style: textStyle),
                                                    Text(
                                                      data["id"].toString(),
                                                      style: textStyle,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          2, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        data["street"],
                                                        style: textStyle,
                                                      ),
                                                      Text(
                                                        ",",
                                                        style: textStyle,
                                                      ),
                                                      Text(
                                                        data["city"],
                                                        style: textStyle,
                                                      ),
                                                      Text(
                                                        ",",
                                                        style: textStyle,
                                                      ),
                                                      Text(
                                                        data["state"],
                                                        style: textStyle,
                                                      ),
                                                      Text(
                                                        ",",
                                                        style: textStyle,
                                                      ),
                                                      Text(
                                                        data["country"],
                                                        style: textStyle,
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Text("No data to display");
                    }
                  })
            ],
          );
        },
      ),
    );
  }
}
