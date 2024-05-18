import 'package:hive/hive.dart';

part 'hive_model_class.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String itemName;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String image;

  @HiveField(4)
   int quantity;

  CartItem(
      {required this.id,
      required this.itemName,
      required this.price,
      required this.image,
      this.quantity = 1});
}
