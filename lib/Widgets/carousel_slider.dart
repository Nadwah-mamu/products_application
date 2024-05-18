import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselList.length,
      options: CarouselOptions(height: 180,
        autoPlay: true,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          width: MediaQuery.sizeOf(context).width*0.70,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(fit:BoxFit.fill,image:AssetImage(carouselList[index].toString()) )),

        );
      },
    );
  }
}
