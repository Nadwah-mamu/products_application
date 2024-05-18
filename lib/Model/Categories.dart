import 'dart:ui';

class Category{
  String? image;
  String? text;
  Category({required this.image,required this.text});
}
final List categoryList=[
  Category(image: "assets/berries.jpg", text: "Fruits"),
  Category(image: "assets/veggie.jpg", text: "Veggies"),
  Category(image: "assets/spice.jpg", text: "Spices"),
  Category(image: "assets/bread.png", text: "Bread"),



];