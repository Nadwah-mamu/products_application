import 'dart:ui';

import 'package:flutter/material.dart';
//carouselSlider images list

List<String> carouselList = [
  "assets/download.jpeg",
  "assets/download (1).jpeg",
  "assets/images.jpeg",
  "assets/images (1).jpeg",
  "assets/images (2).png"
];



//textStyles
TextStyle lightGreenLargeFont = TextStyle(
    color: Colors.lightGreen.shade800,
    fontSize: 28,
    fontWeight: FontWeight.bold);


TextStyle lightGreenSmallFont = TextStyle(
    color: Colors.lightGreen.shade800,
    fontSize: 24,
    fontWeight: FontWeight.w500);

//CUSTOMER IMAGES
List<String> customerImages=[""];

const baseUrl = "http://143.198.61.94:8000";