import 'package:flutter/material.dart';

import './screens/category_recipe_screen.dart';
import './screens/meal_categories_screen.dart';
import './models/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meal App",
      theme: themeData(),
      // home: const MealCategory(),
      initialRoute: "/",
      routes: {
        '/': (context) => const MealCategory(),
        CategoryRecipe.screenName: (context) => CategoryRecipe(),
      },
    );
  }
}
