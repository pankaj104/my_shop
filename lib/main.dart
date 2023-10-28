import 'package:flutter/material.dart';
import 'package:my_shop/core/store.dart';
import 'package:my_shop/pages/cart_page.dart';
import 'package:my_shop/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_shop/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import './pages/home_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),

        //debugShowCheckedModeBanner: false,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
