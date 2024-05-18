import 'package:flutter/material.dart';
import 'package:products_app/Screens/home_screen.dart';

import 'bottom_navigation_bar.dart';


class LeadingIcon extends StatelessWidget {
  const LeadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) {
          return BottomNavigation();
        }
        )
        );
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.lightGreen.shade800,size: 30,
      ),
    );
  }
}


