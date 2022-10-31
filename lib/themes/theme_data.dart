import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ).copyWith(
      secondary: Colors.pink,
    ),
    textTheme: const TextTheme(
      // heading 6
      headline6: TextStyle(
        fontFamily: "Raleway",
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),

      // heading 5
      headline5: TextStyle(
        fontFamily: "Raleway",
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
