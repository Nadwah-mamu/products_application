import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier{

  List<bool> likedItem = List.generate(2, (index) => false);
  void favourateIconChange({required int index}){
    likedItem[index] = !likedItem[index];
    notifyListeners();
  }

}