import 'package:flutter/cupertino.dart';

class NavProvider extends ChangeNotifier{
int selectedIndex = 0;
void updateSelectedIndex(int index) {
  selectedIndex = index;
  notifyListeners();
}
}