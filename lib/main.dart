import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:products_app/Controller/Provider/home_page_provider.dart';
import 'package:provider/provider.dart';

import 'Controller/Provider/bottomnav_bar_provider.dart';
import 'Controller/Provider/cart_provider.dart';
import 'Controller/Provider/customer_provider.dart';
import 'Controller/Provider/product_provider.dart';
import 'Widgets/bottom_navigation_bar.dart';
import 'package:products_app/Model/hive_model_class.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter(CartItemAdapter());

  await Hive.openBox('hive_cart');


  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProvider(create: (_) => HomePageProvider(),),
            ChangeNotifierProvider(create: (_) => CustomerProvider(),),


            // Add more providers if needed
          ],

          child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:BottomNavigation(),
    );
  }
}


