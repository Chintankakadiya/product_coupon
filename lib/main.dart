import 'package:flutter/material.dart';
import 'package:product_coupon/screens/cart_page.dart';
import 'package:product_coupon/screens/home_page.dart';
import 'package:product_coupon/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_provider.dart';
import 'globe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prep = await SharedPreferences.getInstance();
  Globle.data = prep.getBool('data') ?? false;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
      )
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        '/': (context) => Home_Page(),
        'splash_screen': (context) => splash_screen(),
        'Cart_Page': (context) => Cart_Page(),
      },
    ),
  ));
}
