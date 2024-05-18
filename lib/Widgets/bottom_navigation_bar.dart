import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:products_app/Controller/Provider/bottomnav_bar_provider.dart';
import 'package:provider/provider.dart';

import '../Screens/customer_screen.dart';
import '../Screens/home_screen.dart';
import '../Screens/products_screen.dart';

class BottomNavigation extends StatelessWidget {
  List pages = [HomeScreen(), ProductScreen(), CustomerScreen()];

  @override
  Widget build(BuildContext context) {
    var navProvider = Provider.of<NavProvider>(context);
    return Scaffold(
        bottomNavigationBar: SnakeNavigationBar.color(
          height: 60,
          snakeViewColor: Colors.lightGreen,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.lightGreen.shade100,
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: SnakeShape.indicator,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          currentIndex: navProvider.selectedIndex,
          onTap: (index) => navProvider.updateSelectedIndex(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt,
                  size: 30,
                ),
                label: 'Products'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_3,
                  size: 30,
                ),
                label: 'Customers'),
          ],
        ),
        body: pages[navProvider.selectedIndex]);
  }
}
