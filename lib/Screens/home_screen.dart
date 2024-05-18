import 'package:flutter/material.dart';
import 'package:products_app/Controller/Provider/home_page_provider.dart';
import 'package:products_app/Model/Categories.dart';
import 'package:products_app/Utils/constants.dart';
import 'package:products_app/Widgets/carousel_slider.dart';
import 'package:products_app/Widgets/cart_icon.dart';
import 'package:provider/provider.dart';

import '../Controller/Provider/home_page_provider.dart';
import '../Controller/Provider/home_page_provider.dart';
import '../Controller/Provider/home_page_provider.dart';
import '../Model/discovery_class.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //Variables
  TextEditingController searchController = TextEditingController();
  OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.lightGreen.shade50,
        appBar: AppBar(
          toolbarHeight: 40,
          title: Row(
            children: [
              Text(
                "Good day!",
                style: lightGreenLargeFont,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.waving_hand,
                color: Colors.grey.shade800,
              )
            ],
          ),
          actions: [ShoppingCart()],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      enabledBorder: border,
                      focusedBorder: border,
                      hintText: "Search Categories",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: Icon(Icons.search))),
              CustomCarousel(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      "Categories",
                      style: lightGreenSmallFont,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 90,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundImage:
                                AssetImage(categoryList[index].image),
                          ),
                          Text(categoryList[index].text)
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  children: [
                    Text(
                      "Discovery",
                      style: lightGreenSmallFont,
                    )
                  ],
                ),
              ),
              Flex(direction: Axis.vertical, children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: discoveryList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          height: 120,
                          width: MediaQuery.sizeOf(context).width / 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      discoveryList[index].image,
                                      height: 75,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          homePageProvider.favourateIconChange(
                                              index: index);
                                        },
                                        icon: Consumer<HomePageProvider>(
                                          builder: (BuildContext context,
                                              HomePageProvider value,
                                              Widget? child) {
                                            return Icon(value.likedItem[index] ?
                                            Icons.favorite_rounded:Icons.favorite_outline,
                                              color: Colors.red,
                                            );
                                          },
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        discoveryList[index].text,
                                        style: TextStyle(
                                            color: Colors.lightGreen.shade800,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.currency_pound,
                                      color: Colors.lightGreen.shade800,
                                    ),
                                    Text(
                                      discoveryList[index].rupees,
                                      style: TextStyle(
                                          color: Colors.lightGreen.shade800,
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
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 4)),
              ])
            ],
          ),
        ));
  }
}
