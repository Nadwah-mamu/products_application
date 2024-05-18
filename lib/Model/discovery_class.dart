class Discovery {
  String? image;
  String? text;
  String? rupees;
  Discovery({required this.image, required this.text, required this.rupees});
}

final List discoveryList = [
  Discovery(
      image: "assets/chicken.png", text: "Chicken Broiler", rupees: "35"),
  Discovery(
      image: "assets/beef.jpeg", text: "Beef Tenderloin", rupees: "45"),

];
