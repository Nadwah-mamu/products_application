
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerProvider extends ChangeNotifier {
  TextEditingController customerSearchController = TextEditingController();
String value="";
  searchCustomer(v) async {
    value=customerSearchController.text;
    notifyListeners();
  }
  customerSelection(String value)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString("customer_id", value);
    notifyListeners();
  }
}
