import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      iconTheme: IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(color: Colors.black, elevation: 0.0),
      textTheme: Theme.of(context).textTheme);

  static ThemeData DarkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}
