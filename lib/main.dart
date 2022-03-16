import 'package:flutter/material.dart';
import 'package:flutter_days/utils/MyRoutes.dart';
import 'pages/homePage.dart';
import 'pages/login_Page.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      //  fontFamily: GoogleFonts.lato().fontFamily),
      //primaryTextTheme: GoogleFonts.latoTextTheme()),

      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/login",
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.logIn: (context) => LogInPage(),
      },
    );
  }
}
