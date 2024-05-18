import 'dart:convert';

import 'package:http/http.dart';

sendOrderDetails({required String? id, required double totalPrice,required List products})async{
  try{
    var url="http://143.198.61.94:8000/api/orders/";
   var map= {"customer_id":id.toString(),"total_price":totalPrice.toString(),"products":products.toString()};
    var response=await post(Uri.parse(url),body:map );
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
      print(data);
    }else{
      print(response.statusCode);
    }
  }
  catch(e){
    print("error is ${e.toString()}");
  }

}