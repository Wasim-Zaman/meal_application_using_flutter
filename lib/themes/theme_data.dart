import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.teal,
    ).copyWith(
      secondary: Colors.yellow,
    ),
    // primaryColor: const Color.fromRGBO(37, 27, 55, 1),
    // accentColor: const Color.fromRGBO(255, 202, 202, 1),
    textTheme: const TextTheme(
      // heading 6
      headline6: TextStyle(
        fontFamily: "Raleway",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        // decorationColor: Colors.white,
        color: Colors.white,
      ),

      //heading5
      headline5: TextStyle(
        fontFamily: "Raleway",
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        inherit: true,
      ),
    ),
  );
}
