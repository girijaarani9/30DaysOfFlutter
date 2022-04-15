import 'package:flutter/material.dart';
import 'package:flutter_days/core/store.dart';
import 'package:flutter_days/pages/cartPage.dart';
import 'package:flutter_days/utils/MyRoutes.dart';
import 'package:flutter_days/widgets/themes.dart';
import 'pages/homePage.dart';
import 'pages/login_Page.dart';
import 'package:velocity_x/velocity_x.dart';

//import 'package:google_fonts/google_fonts.dart';
//Learnt abour trees, constraints, build context.
void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),

      //  fontFamily: GoogleFonts.lato().fontFamily),
      //primaryTextTheme: GoogleFonts.latoTextTheme()),

      darkTheme: MyTheme.DarkTheme(context),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.logIn: (context) => LogInPage(),
        MyRoutes.cart: (context) => CartPage(),
      },
    );
  }
}
