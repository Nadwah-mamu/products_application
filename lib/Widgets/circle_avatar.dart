import 'package:flutter/material.dart';

class CircleAvatar1 extends StatelessWidget {
  double? radius;
  IconData? iconData;
  double? size;
   CircleAvatar1({
    required this.radius,required this.iconData,required this.size
});


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue.shade900,
      child: Center(
        child: Icon(
          iconData,
          color: Colors.white,
          size: size,
          weight: 20,
        ),
      ),
    );
  }
}
