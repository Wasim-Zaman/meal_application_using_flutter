import 'package:flutter/material.dart';

import '../screens/category_recipe_screen.dart';
import '../screens/meal_categories_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../themes/theme_data.dart';

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
        '/': (context) => const TabScreen(),
        CategoryRecipe.screenName: (context) => const CategoryRecipe(),
        MealDetail.screenName: (context) => const MealDetail(),
      },
      onGenerateRoute: (settings) {
        // if (settings.name == '/'){

        // }
        // else if (settings.name == '/abc'){

        // }
      },

      // If we enter to an unknwon screen, then we should handle that case
      onUnknownRoute: (settings) {
        MaterialPageRoute(
          builder: (context) => const MealCategory(),
        );
      },
    );
  }
}