import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.bodyText1));
  static ThemeData DarkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);

  static Color cream = Color(0xfff5f5f5);
  static Color blue = Colors.deepPurple;
  static Color grey = Colors.blueGrey;
  static Color black = Colors.black;
}
