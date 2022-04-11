import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: MyTheme.cream,
      buttonColor: blue,
      focusColor: blue,
      accentColor: Colors.black,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.bodyText1));
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: MyTheme.darkgrey,
      accentColor: Colors.white,
      buttonColor: lightblue,
      focusColor: lightblue,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.bodyText1));

  static Color cream = Color(0xfff5f5f5);

  static Color blue = Colors.deepPurple;
  static Color grey = Colors.blueGrey;
  static Color black = Colors.black;
  static Color darkgrey = Color.fromRGBO(24, 24, 27, 1);
  static Color lightblue = Vx.indigo400;
}
