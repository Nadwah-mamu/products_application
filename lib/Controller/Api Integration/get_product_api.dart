import 'dart:convert';

import 'package:http/http.dart';

fetchProductsData()async{
  try{
    const url="http://143.198.61.94:8000/api/products/";
    Response response=await get(Uri.parse(url));
    if(response.statusCode==200){
      var body=jsonDecode(response.body);
      return body;
    }
  }
  catch(e){
    print('error is ${e.toString()}');
  }

}